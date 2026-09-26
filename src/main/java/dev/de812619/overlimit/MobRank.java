package dev.de812619.overlimit;

import net.minecraft.core.registries.Registries;
import net.minecraft.resources.Identifier;
import net.minecraft.resources.ResourceKey;
import net.minecraft.server.MinecraftServer;
import net.minecraft.server.level.ServerLevel;
import net.minecraft.tags.TagKey;
import net.minecraft.world.entity.Entity;
import net.minecraft.world.entity.EntityType;
import net.minecraft.world.level.Level;

import java.util.Collections;
import java.util.IdentityHashMap;
import java.util.Set;

/**
 * 読み込まれた未強化モブを、その tick の終わりに {@code mob/scan} へ渡す。
 * 階級・体力・装備の中身は関数のまま。名前付きは関数側が外す。
 * ネザーレイズとシティクランプは召喚関数が階級を付けるので、ここでは触らない。
 * ブラッドムーン中は、間引きが残す距離に入ってから {@code mob/scan} する。
 */
final class MobRank {
	private static final ResourceKey<Level> BLOOD_WORLD = ResourceKey.create(
		Registries.DIMENSION,
		Identifier.fromNamespaceAndPath("overlimit", "blood_world")
	);
	private static final TagKey<EntityType<?>> CAN_BE_DANGER = TagKey.create(
		Registries.ENTITY_TYPE,
		Identifier.fromNamespaceAndPath("overlimit", "can_be_danger")
	);
	private static final int BUDGET = 64;

	private static final Set<Entity> PENDING = Collections.newSetFromMap(new IdentityHashMap<>());

	private MobRank() {
	}

	static void clear() {
		PENDING.clear();
	}

	static void onLoad(Entity entity, ServerLevel world) {
		if (!entity.getType().builtInRegistryHolder().is(CAN_BE_DANGER)) {
			return;
		}
		if (skip(entity)) {
			return;
		}
		PENDING.add(entity);
	}

	static void onUnload(Entity entity, ServerLevel world) {
		PENDING.remove(entity);
	}

	static void onEndTick(MinecraftServer server) {
		if (PENDING.isEmpty()) {
			return;
		}
		int left = BUDGET;
		for (Entity entity : PENDING.toArray(Entity[]::new)) {
			if (entity.isRemoved() || !(entity.level() instanceof ServerLevel)) {
				PENDING.remove(entity);
				continue;
			}
			if (skip(entity)) {
				PENDING.remove(entity);
				continue;
			}
			if (waitForKeep(server, entity)) {
				continue;
			}
			if (left <= 0) {
				return;
			}
			PENDING.remove(entity);
			HotTick.run(server, entity, "mob/scan");
			left--;
		}
	}

	/** 遠い自然湧きをブラッドムーンに入れると、間引きで消えて近くの頭数を食う。 */
	private static boolean waitForKeep(MinecraftServer server, Entity entity) {
		if (!(entity.level() instanceof ServerLevel level)) {
			return false;
		}
		ResourceKey<Level> dimension = level.dimension();
		boolean bloodMoon = dimension == BLOOD_WORLD && Scores.get(server, "#bw_active") == 1
			|| dimension == Level.OVERWORLD && Scores.get(server, "#bm_active") == 1;
		return bloodMoon && !EventMobs.withinKeep(entity);
	}

	/** すでに階級がある個体と、専用の抽選を持つウェーブは渡さない。 */
	private static boolean skip(Entity entity) {
		Set<String> tags = entity.entityTags();
		return tags.contains("overlimit.scanned")
			|| tags.contains("overlimit.elite")
			|| tags.contains("overlimit.nr_wave")
			|| tags.contains("overlimit.cc_wave")
			|| tags.contains("overlimit.nr_new")
			|| tags.contains("overlimit.cc_new");
	}
}
