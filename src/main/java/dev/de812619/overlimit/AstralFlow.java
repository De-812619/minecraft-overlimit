package dev.de812619.overlimit;

import net.fabricmc.fabric.api.entity.event.v1.ServerLivingEntityEvents;
import net.minecraft.resources.Identifier;
import net.minecraft.server.MinecraftServer;
import net.minecraft.server.level.ServerLevel;
import net.minecraft.server.level.ServerPlayer;
import net.minecraft.world.entity.EquipmentSlot;
import net.minecraft.world.entity.LivingEntity;

/**
 * アストラルフロー（保留）：スニーク中の被ダメージを {@code do_drain} で打ち消す。
 * 旧実装の毎 tick Health NBT ポーリングを廃止し {@code ServerLivingEntityEvents.ALLOW_DAMAGE}
 * で即時発火する。CD と hunger_t の管理は do_drain / tick.mcfunction が行う。
 */
final class AstralFlow {
	private static final Identifier ENCHANT_ID =
		Identifier.fromNamespaceAndPath("overlimit", "astral_flow");

	private AstralFlow() {
	}

	static void register() {
		ServerLivingEntityEvents.ALLOW_DAMAGE.register(AstralFlow::onDamage);
	}

	private static boolean onDamage(LivingEntity entity, net.minecraft.world.damagesource.DamageSource source, float amount) {
		if (!(entity instanceof ServerPlayer player)) return true;
		if (!player.isCrouching()) return true;

		// チェストプレートにアストラルフローがあるか確認
		if (!SkyWalk.hasEnchant(player.getItemBySlot(EquipmentSlot.CHEST), ENCHANT_ID)) return true;

		// do_drain を呼び出す（内部で draincd チェック・食料消費・回復）
		if (!(player.level() instanceof ServerLevel serverLevel)) return true;
		MinecraftServer server = serverLevel.getServer();
		HotTick.run(server, player, "enchant/astral_flow/do_drain");

		return true; // ダメージを通す（do_drain の instant_health が補填）
	}
}
