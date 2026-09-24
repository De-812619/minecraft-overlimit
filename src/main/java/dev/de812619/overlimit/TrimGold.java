package dev.de812619.overlimit;

import net.fabricmc.fabric.api.event.lifecycle.v1.ServerTickEvents;
import net.minecraft.server.MinecraftServer;
import net.minecraft.server.level.ServerLevel;
import net.minecraft.server.level.ServerPlayer;
import net.minecraft.world.entity.LivingEntity;
import net.minecraft.world.entity.ai.Brain;
import net.minecraft.world.entity.ai.memory.MemoryModuleType;
import net.minecraft.world.entity.monster.piglin.Piglin;
import net.minecraft.world.phys.AABB;

import java.util.List;
import java.util.Optional;
import java.util.UUID;

/**
 * 金トリムセット: ピグリンの敵対解除を Java で安定化。
 * 金ヘルメット差し替え（見た目／piglin_safe_armor）はデータパックのまま。
 */
final class TrimGold {
	private static final String SET_TAG = "overlimit.trim.set.gold";
	private static final String ANGER_SCORE = "overlimit.trim.anger";
	private static final double PACIFY_RANGE = 16.0;

	private TrimGold() {
	}

	static void register() {
		ServerTickEvents.END_SERVER_TICK.register(TrimGold::onEndTick);
	}

	private static void onEndTick(MinecraftServer server) {
		for (ServerPlayer player : server.getPlayerList().getPlayers()) {
			if (!player.entityTags().contains(SET_TAG)) continue;
			if (Scores.getPlayer(player, ANGER_SCORE) > 0) continue;
			if (!(player.level() instanceof ServerLevel level)) continue;
			pacifyNear(level, player);
		}
	}

	private static void pacifyNear(ServerLevel level, ServerPlayer player) {
		AABB box = player.getBoundingBox().inflate(PACIFY_RANGE);
		List<Piglin> piglins = level.getEntitiesOfClass(Piglin.class, box, piglin -> true);
		UUID playerId = player.getUUID();

		for (Piglin piglin : piglins) {
			Brain<Piglin> brain = piglin.getBrain();
			brain.eraseMemory(MemoryModuleType.NEAREST_TARGETABLE_PLAYER_NOT_WEARING_GOLD);
			brain.eraseMemory(MemoryModuleType.NEAREST_VISIBLE_ATTACKABLE_PLAYER);

			boolean huntingPlayer = false;
			LivingEntity target = piglin.getTarget();
			if (target != null && target.getUUID().equals(playerId)) {
				huntingPlayer = true;
			}
			Optional<UUID> angryAt = brain.getMemory(MemoryModuleType.ANGRY_AT);
			if (angryAt.isPresent() && angryAt.get().equals(playerId)) {
				huntingPlayer = true;
			}
			Optional<LivingEntity> attackTarget = brain.getMemory(MemoryModuleType.ATTACK_TARGET);
			if (attackTarget.isPresent() && attackTarget.get().getUUID().equals(playerId)) {
				huntingPlayer = true;
			}

			if (!huntingPlayer) continue;

			brain.eraseMemory(MemoryModuleType.ATTACK_TARGET);
			brain.eraseMemory(MemoryModuleType.ANGRY_AT);
			brain.eraseMemory(MemoryModuleType.UNIVERSAL_ANGER);
			piglin.setTarget(null);
		}
	}
}
