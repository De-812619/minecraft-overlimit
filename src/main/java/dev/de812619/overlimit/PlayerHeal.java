package dev.de812619.overlimit;

import net.fabricmc.fabric.api.entity.event.v1.ServerLivingEntityEvents;
import net.minecraft.commands.CommandSourceStack;
import net.minecraft.commands.functions.CommandFunction;
import net.minecraft.core.component.DataComponents;
import net.minecraft.core.particles.ParticleTypes;
import net.minecraft.nbt.CompoundTag;
import net.minecraft.resources.Identifier;
import net.minecraft.server.MinecraftServer;
import net.minecraft.server.level.ServerLevel;
import net.minecraft.server.level.ServerPlayer;
import net.minecraft.sounds.SoundEvents;
import net.minecraft.sounds.SoundSource;
import net.minecraft.world.damagesource.DamageSource;
import net.minecraft.world.entity.Entity;
import net.minecraft.world.entity.EquipmentSlot;
import net.minecraft.world.entity.LivingEntity;
import net.minecraft.world.item.ItemStack;
import net.minecraft.world.item.component.CustomData;
import net.minecraft.world.phys.Vec3;

/**
 * プレイヤー回復の共通ヘルパと、ソウルテイカー／UL 王族の正確な +HP。
 */
final class PlayerHeal {
	private static final Identifier SOUL_TAKER =
		Identifier.fromNamespaceAndPath("overlimit", "soul_taker");
	private static final Identifier BURST_ROYAL =
		Identifier.fromNamespaceAndPath("overlimit", "item/unlimited/armor_burst_royal");
	private static final String CD_ROYAL = "overlimit.cd.ul_royal";
	private static final float SOUL_HEAL = 6.0f;
	private static final float ROYAL_HEAL = 3.0f;
	private static final int ROYAL_CD_TICKS = 120;
	private static final int ROYAL_MIN_PIECES = 3;

	private PlayerHeal() {
	}

	static void register() {
		ServerLivingEntityEvents.AFTER_DEATH.register(PlayerHeal::onDeath);
		ServerLivingEntityEvents.AFTER_DAMAGE.register(PlayerHeal::onDamage);
	}

	/** {@code setHealth(min(maxHealth, current + amount))}。既に死んでいる場合は何もしない。 */
	static void heal(ServerPlayer player, float amount) {
		if (amount <= 0.0f) return;
		float current = player.getHealth();
		if (current <= 0.0f) return;
		float max = player.getMaxHealth();
		player.setHealth(Math.min(max, current + amount));
	}

	private static void onDeath(LivingEntity entity, DamageSource source) {
		Entity killer = source.getEntity();
		if (!(killer instanceof ServerPlayer player)) return;
		if (!(player.level() instanceof ServerLevel level)) return;

		ItemStack main = player.getItemBySlot(EquipmentSlot.MAINHAND);
		if (!SkyWalk.hasEnchant(main, SOUL_TAKER)) return;

		heal(player, SOUL_HEAL);
		Vec3 pos = player.position();
		level.sendParticles(ParticleTypes.HEART, pos.x, pos.y + 1.2, pos.z, 8, 0.35, 0.4, 0.35, 0.0);
		level.playSound(null, player.blockPosition(), SoundEvents.PLAYER_LEVELUP, SoundSource.PLAYERS, 0.5f, 1.6f);
	}

	private static void onDamage(LivingEntity entity, DamageSource source,
		float baseDamageTaken, float damageTaken, boolean blocked) {
		if (blocked) return;
		if (!(entity instanceof ServerPlayer player)) return;
		if (!source.isDirect()) return;
		if (source.getEntity() == null) return;
		if (!(player.level() instanceof ServerLevel level)) return;

		if (Scores.getPlayer(player, CD_ROYAL) > 0) return;
		if (countRoyalPieces(player) < ROYAL_MIN_PIECES) return;

		Scores.setPlayer(player, CD_ROYAL, ROYAL_CD_TICKS);
		heal(player, ROYAL_HEAL);

		Vec3 pos = player.position();
		level.sendParticles(ParticleTypes.HEART, pos.x, pos.y + 1.2, pos.z, 3, 0.28, 0.35, 0.28, 0.0);
		level.playSound(null, player.blockPosition(), SoundEvents.PLAYER_LEVELUP, SoundSource.PLAYERS, 0.35f, 1.8f);
		runBurstRoyal(level, player);
	}

	private static int countRoyalPieces(ServerPlayer player) {
		int n = 0;
		if (hasRoyalFlag(player.getItemBySlot(EquipmentSlot.HEAD), "unlimited_royal_helmet")) n++;
		if (hasRoyalFlag(player.getItemBySlot(EquipmentSlot.CHEST), "unlimited_royal_chestplate")) n++;
		if (hasRoyalFlag(player.getItemBySlot(EquipmentSlot.LEGS), "unlimited_royal_leggings")) n++;
		if (hasRoyalFlag(player.getItemBySlot(EquipmentSlot.FEET), "unlimited_royal_boots")) n++;
		return n;
	}

	private static boolean hasRoyalFlag(ItemStack stack, String key) {
		if (stack.isEmpty()) return false;
		CustomData data = stack.get(DataComponents.CUSTOM_DATA);
		if (data == null || data.isEmpty()) return false;
		CompoundTag root = data.copyTag();
		CompoundTag ol = root.getCompoundOrEmpty("overlimit");
		return ol.getBooleanOr(key, false);
	}

	private static void runBurstRoyal(ServerLevel level, ServerPlayer player) {
		MinecraftServer server = level.getServer();
		CommandFunction<CommandSourceStack> fn = server.getFunctions().get(BURST_ROYAL).orElse(null);
		if (fn == null) {
			if (OverlimitMod.LOGGER.isWarnEnabled()) {
				OverlimitMod.LOGGER.warn("Missing function {}", BURST_ROYAL);
			}
			return;
		}
		CommandSourceStack source = server.getFunctions().getGameLoopSender()
			.withLevel(level)
			.withEntity(player)
			.withPosition(player.position())
			.withRotation(player.getRotationVector())
			.withSuppressedOutput();
		server.getFunctions().execute(fn, source);
	}
}
