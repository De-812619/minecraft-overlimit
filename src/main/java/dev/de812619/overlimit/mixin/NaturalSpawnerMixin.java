package dev.de812619.overlimit.mixin;

import dev.de812619.overlimit.OverlimitMod;
import net.minecraft.core.BlockPos;
import net.minecraft.server.level.ServerLevel;
import net.minecraft.world.entity.MobCategory;
import net.minecraft.world.level.NaturalSpawner;
import net.minecraft.world.level.chunk.ChunkAccess;
import org.spongepowered.asm.mixin.Mixin;
import org.spongepowered.asm.mixin.injection.At;
import org.spongepowered.asm.mixin.injection.Inject;
import org.spongepowered.asm.mixin.injection.callback.CallbackInfo;

@Mixin(NaturalSpawner.class)
abstract class NaturalSpawnerMixin {
	@Inject(
		method = "spawnCategoryForPosition(Lnet/minecraft/world/entity/MobCategory;Lnet/minecraft/server/level/ServerLevel;Lnet/minecraft/world/level/chunk/ChunkAccess;Lnet/minecraft/core/BlockPos;Lnet/minecraft/world/level/NaturalSpawner$SpawnPredicate;Lnet/minecraft/world/level/NaturalSpawner$AfterSpawnCallback;)V",
		at = @At("HEAD"),
		cancellable = true
	)
	private static void overlimit$stopBloodNightMonsters(
		MobCategory category,
		ServerLevel level,
		ChunkAccess chunk,
		BlockPos pos,
		NaturalSpawner.SpawnPredicate predicate,
		NaturalSpawner.AfterSpawnCallback afterSpawn,
		CallbackInfo ci
	) {
		if (category == MobCategory.MONSTER && OverlimitMod.blockMonsterSpawns(level)) {
			ci.cancel();
		}
	}
}
