package dev.de812619.overlimit;

import net.fabricmc.fabric.api.entity.event.v1.ServerLivingEntityEvents;
import net.minecraft.resources.ResourceKey;
import net.minecraft.server.MinecraftServer;
import net.minecraft.server.level.ServerLevel;
import net.minecraft.server.level.ServerPlayer;
import net.minecraft.world.damagesource.DamageSource;
import net.minecraft.world.entity.LivingEntity;
import net.minecraft.world.level.Level;

/**
 * イベント中の消耗。戦闘由来の被弾のうち約 35% で、既存の削り関数を実行する。
 * 量は脅威指数、鉄トリム半減、音消しは関数側。
 */
final class Attrition {
	private Attrition() {
	}

	static void register() {
		ServerLivingEntityEvents.AFTER_DAMAGE.register(Attrition::onDamage);
	}

	private static void onDamage(LivingEntity entity, DamageSource source,
		float baseDamageTaken, float damageTaken, boolean blocked) {
		if (!(entity instanceof ServerPlayer player)) {
			return;
		}
		if (damageTaken <= 0.0f || source.getEntity() == null) {
			return;
		}
		if (!(player.level() instanceof ServerLevel level)) {
			return;
		}
		ResourceKey<Level> dimension = level.dimension();
		if (dimension != Level.OVERWORLD && dimension != Level.NETHER && dimension != Level.END) {
			return;
		}
		MinecraftServer server = level.getServer();
		if (Scores.get(server, "#no_nethering") == 1) {
			return;
		}
		if (Scores.get(server, "#bm_active") != 1
			&& Scores.get(server, "#no_active") != 1
			&& Scores.get(server, "#nr_combat") != 1
			&& Scores.get(server, "#cc_combat") != 1) {
			return;
		}
		if (player.getRandom().nextFloat() >= 0.35f) {
			return;
		}
		HotTick.run(server, player, "attrition/apply");
	}
}
