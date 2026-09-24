package dev.de812619.overlimit;

import net.fabricmc.fabric.api.entity.event.v1.ServerLivingEntityEvents;
import net.fabricmc.fabric.api.event.lifecycle.v1.ServerTickEvents;
import net.minecraft.core.Holder;
import net.minecraft.core.component.DataComponents;
import net.minecraft.core.particles.ParticleTypes;
import net.minecraft.network.protocol.game.ClientboundSetEntityMotionPacket;
import net.minecraft.resources.Identifier;
import net.minecraft.server.MinecraftServer;
import net.minecraft.server.level.ServerLevel;
import net.minecraft.server.level.ServerPlayer;
import net.minecraft.sounds.SoundEvents;
import net.minecraft.sounds.SoundSource;
import net.minecraft.util.Mth;
import net.minecraft.world.damagesource.DamageTypes;
import net.minecraft.world.entity.EquipmentSlot;
import net.minecraft.world.entity.LivingEntity;
import net.minecraft.world.item.ItemStack;
import net.minecraft.world.item.enchantment.Enchantment;
import net.minecraft.world.item.enchantment.ItemEnchantments;
import net.minecraft.world.level.GameType;
import net.minecraft.world.phys.Vec3;

import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

/**
 * スカイウォーク：空中でジャンプキーを押すと二段ジャンプ。
 * - 地上ジャンプでは発動しない（prevOnGround + risingEdge 制御）
 * - 発動後は着地まで落下ダメージ無効
 * - CD が切れていてジャンプキーを押しっぱなしなら即連続発動
 */
final class SkyWalk {
	private static final Identifier ENCHANT_ID =
		Identifier.fromNamespaceAndPath("overlimit", "sky_walk");

	/** 上昇初速度。バニラ地上ジャンプ = 0.42。約1ブロック高くするため 0.60。 */
	private static final double JUMP_Y = 0.60;
	/** バニラ {@code jumpFromGround} と同じ、スプリント時の前方加速。 */
	private static final double SPRINT_JUMP_BOOST = 0.2;
	/** 発動後のクールダウン tick 数。 */
	private static final int CD_TICKS = 6;

	/** 前 tick の onGround 状態（地上ジャンプ瞬間を除外するため）。 */
	private static final Map<UUID, Boolean> prevOnGround = new HashMap<>();
	/** 前 tick のジャンプキー状態（ライジングエッジ検出）。 */
	private static final Map<UUID, Boolean> prevJumping = new HashMap<>();
	/** 空中ジャンプ使用済みフラグ（着地でリセット）。 */
	private static final Map<UUID, Boolean> airUsed = new HashMap<>();
	/** CD カウンタ（0 で次のジャンプ可）。 */
	private static final Map<UUID, Integer> cooldown = new HashMap<>();

	private SkyWalk() {
	}

	static void register() {
		ServerTickEvents.END_SERVER_TICK.register(SkyWalk::onTick);
		// 落下ダメージをイベントで確実にキャンセル（fallDistance リセットでは
		// 高速落下時の1tick分が漏れるため）
		ServerLivingEntityEvents.ALLOW_DAMAGE.register(SkyWalk::onDamage);
	}

	private static boolean onDamage(LivingEntity entity,
		net.minecraft.world.damagesource.DamageSource source, float amount) {
		if (!(entity instanceof ServerPlayer player)) return true;
		if (!source.is(DamageTypes.FALL)) return true;
		// スカイウォーク付きブーツを装備中は常に落下ダメージ無効
		return !hasSkyWalk(player.getItemBySlot(EquipmentSlot.FEET));
	}

	static void clearPlayer(UUID id) {
		prevOnGround.remove(id);
		prevJumping.remove(id);
		airUsed.remove(id);
		cooldown.remove(id);
	}

	private static void onTick(MinecraftServer server) {
		for (ServerPlayer player : server.getPlayerList().getPlayers()) {
			UUID id = player.getUUID();

			// --- CD カウントダウン ---
			int cd = cooldown.getOrDefault(id, 0);
			boolean justReady = false; // この tick に CD が 0 になった
			if (cd > 0) {
				cd--;
				cooldown.put(id, cd);
				if (cd == 0) {
					airUsed.put(id, false);
					justReady = true;
				}
			}

			// --- エンチャント・モードチェック ---
			GameType gm = player.gameMode.getGameModeForPlayer();
			if (!hasSkyWalk(player.getItemBySlot(EquipmentSlot.FEET))
				|| gm == GameType.CREATIVE
				|| gm == GameType.SPECTATOR
				|| player.isSwimming()) {
				clearPlayer(id);
				continue;
			}

			boolean onGround = player.onGround();
			boolean wasOnGround = prevOnGround.getOrDefault(id, true);
			boolean jumping = player.getLastClientInput().jump();
			boolean prevJump = prevJumping.getOrDefault(id, false);

			// --- 着地処理 ---
			if (onGround) {
				airUsed.put(id, false);
			}

			// --- 発動条件 ---
			// trulyAirborne: 前 tick も空中 → 地上ジャンプ瞬間(tick N)は除外
			boolean trulyAirborne = !onGround && !wasOnGround;
			boolean risingEdge = jumping && !prevJump; // 離して押した
			boolean heldWhenReady = justReady && jumping; // CD 切れ瞬間に押しっぱなし
			boolean used = airUsed.getOrDefault(id, false);
			int currentCd = cooldown.getOrDefault(id, 0);

			if (trulyAirborne && (risingEdge || heldWhenReady) && !used && currentCd <= 0) {
				// 地上ジャンプと同じく水平速度は残し、スプリント中は進行方向へ加速する
				Vec3 vel = player.getDeltaMovement();
				double x = vel.x;
				double z = vel.z;
				if (player.isSprinting()) {
					float yawRad = player.getYRot() * Mth.DEG_TO_RAD;
					x += -Mth.sin(yawRad) * SPRINT_JUMP_BOOST;
					z += Mth.cos(yawRad) * SPRINT_JUMP_BOOST;
				}
				player.setDeltaMovement(x, Math.max(vel.y, JUMP_Y), z);
				player.needsSync = true;
				player.hurtMarked = true;
				player.connection.send(new ClientboundSetEntityMotionPacket(player));

				airUsed.put(id, true);
				cooldown.put(id, CD_TICKS);

				// 足元にパーティクル（飛翔イメージ）
				if (player.level() instanceof ServerLevel level) {
					level.sendParticles(ParticleTypes.CLOUD,
						player.getX(), player.getY(), player.getZ(),
						20, 0.35, 0.05, 0.35, 0.02);
				}

				// 音（全員に聞こえる）
				player.level().playSound(null,
					player.getX(), player.getY(), player.getZ(),
					SoundEvents.BREEZE_JUMP, SoundSource.PLAYERS, 0.5f, 1.25f);

			}

			prevOnGround.put(id, onGround);
			prevJumping.put(id, jumping);
		}
	}

	static boolean hasSkyWalk(ItemStack stack) {
		return hasEnchant(stack, ENCHANT_ID);
	}

	/** DataComponents.ENCHANTMENTS で ID を突き合わせてレベルを確認する。 */
	static boolean hasEnchant(ItemStack stack, Identifier id) {
		if (stack.isEmpty()) return false;
		ItemEnchantments enchants = stack.get(DataComponents.ENCHANTMENTS);
		if (enchants == null || enchants.isEmpty()) return false;
		for (Holder<Enchantment> holder : enchants.keySet()) {
			if (holder.unwrapKey().map(k -> id.equals(k.identifier())).orElse(false)) {
				return enchants.getLevel(holder) > 0;
			}
		}
		return false;
	}
}
