package dev.de812619.overlimit;

import net.fabricmc.fabric.api.entity.event.v1.ServerLivingEntityEvents;
import net.minecraft.resources.Identifier;
import net.minecraft.server.level.ServerPlayer;
import net.minecraft.world.damagesource.DamageTypes;
import net.minecraft.world.entity.EquipmentSlot;
import net.minecraft.world.entity.LivingEntity;

/**
 * 重力軽減の落下ダメは JSON の damage_immunity に加え、
 * スカイウォークと同じ ALLOW_DAMAGE でも切る。
 */
final class LightGravity {
	private static final Identifier ENCHANT_ID =
		Identifier.fromNamespaceAndPath("overlimit", "light_gravity");

	private LightGravity() {
	}

	static void register() {
		ServerLivingEntityEvents.ALLOW_DAMAGE.register(LightGravity::onDamage);
	}

	private static boolean onDamage(LivingEntity entity,
		net.minecraft.world.damagesource.DamageSource source, float amount) {
		if (!(entity instanceof ServerPlayer player)) return true;
		if (!source.is(DamageTypes.FALL)) return true;
		return !SkyWalk.hasEnchant(player.getItemBySlot(EquipmentSlot.LEGS), ENCHANT_ID);
	}
}
