package dev.de812619.overlimit;

import net.fabricmc.fabric.api.event.lifecycle.v1.ServerTickEvents;
import net.minecraft.core.registries.Registries;
import net.minecraft.resources.Identifier;
import net.minecraft.server.MinecraftServer;
import net.minecraft.server.level.ServerLevel;
import net.minecraft.server.level.ServerPlayer;
import net.minecraft.tags.TagKey;
import net.minecraft.world.effect.MobEffectInstance;
import net.minecraft.world.effect.MobEffects;
import net.minecraft.world.entity.Entity;
import net.minecraft.world.entity.EntityType;
import net.minecraft.world.entity.EquipmentSlot;
import net.minecraft.world.entity.LivingEntity;
import net.minecraft.world.phys.AABB;

/**
 * 千里眼：スニーク中、半径 32 の敵対に発光を付ける。
 * 残り時間がある個体は付け直さない。
 */
final class Clairvoyance {
	private static final Identifier ENCHANT_ID =
		Identifier.fromNamespaceAndPath("overlimit", "clairvoyance");
	private static final TagKey<EntityType<?>> HOSTILE = TagKey.create(
		Registries.ENTITY_TYPE,
		Identifier.fromNamespaceAndPath("overlimit", "hostile")
	);
	private static final double RANGE_SQ = 32.0 * 32.0;
	private static final int GLOW_TICKS = 40;

	private Clairvoyance() {
	}

	static void register() {
		ServerTickEvents.END_SERVER_TICK.register(Clairvoyance::onTick);
	}

	private static void onTick(MinecraftServer server) {
		if ((server.overworld().getGameTime() & 1L) != 0L) {
			return;
		}
		for (ServerPlayer player : server.getPlayerList().getPlayers()) {
			if (!player.isShiftKeyDown()) {
				continue;
			}
			if (!SkyWalk.hasEnchant(player.getItemBySlot(EquipmentSlot.HEAD), ENCHANT_ID)) {
				continue;
			}
			if (!(player.level() instanceof ServerLevel level)) {
				continue;
			}
			AABB box = player.getBoundingBox().inflate(32.0);
			for (Entity entity : level.getEntities(player, box, Clairvoyance::isHostile)) {
				if (player.distanceToSqr(entity) > RANGE_SQ) {
					continue;
				}
				if (entity instanceof LivingEntity living) {
					glow(living);
				}
			}
		}
	}

	private static boolean isHostile(Entity entity) {
		return entity.getType().builtInRegistryHolder().is(HOSTILE);
	}

	private static void glow(LivingEntity living) {
		MobEffectInstance current = living.getEffect(MobEffects.GLOWING);
		if (current != null && current.getDuration() > 20) {
			return;
		}
		living.addEffect(new MobEffectInstance(MobEffects.GLOWING, GLOW_TICKS, 0, false, false));
	}
}
