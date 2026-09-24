package dev.de812619.overlimit;

import net.minecraft.commands.CommandSourceStack;
import net.minecraft.commands.functions.CommandFunction;
import net.minecraft.core.registries.Registries;
import net.minecraft.resources.Identifier;
import net.minecraft.server.MinecraftServer;
import net.minecraft.server.level.ServerLevel;
import net.minecraft.tags.TagKey;
import net.minecraft.world.entity.Entity;
import net.minecraft.world.entity.EntityType;
import net.minecraft.world.entity.EntityTypes;
import net.minecraft.world.scores.Objective;
import net.minecraft.world.scores.PlayerTeam;
import net.minecraft.world.scores.ReadOnlyScoreInfo;
import net.minecraft.world.scores.Scoreboard;

import java.util.Collections;
import java.util.HashSet;
import java.util.IdentityHashMap;
import java.util.Set;

/**
 * 毎tickの広域 {@code @e} の代わりに、読み込まれた対象だけを見て既存関数を実行する。
 * スコア目標名・タグ名・関数名はデータパックと同じ。
 */
final class HotTick {
	private static final TagKey<EntityType<?>> CAN_BE_DANGER = TagKey.create(
		Registries.ENTITY_TYPE,
		Identifier.fromNamespaceAndPath("overlimit", "can_be_danger")
	);
	private static final TagKey<EntityType<?>> ARROWS = TagKey.create(
		Registries.ENTITY_TYPE,
		Identifier.fromNamespaceAndPath("minecraft", "arrows")
	);

	private static final Set<Entity> WATCHED = Collections.newSetFromMap(new IdentityHashMap<>());
	private static final Set<String> MISSING = new HashSet<>();

	private static int eliteCulls;

	private HotTick() {
	}

	static void clear() {
		WATCHED.clear();
		MISSING.clear();
	}

	static Entity[] snapshot() {
		return WATCHED.toArray(Entity[]::new);
	}

	static void onLoad(Entity entity, ServerLevel world) {
		if (shouldWatch(world, entity)) {
			WATCHED.add(entity);
		}
	}

	static void onUnload(Entity entity, ServerLevel world) {
		WATCHED.remove(entity);
	}

	static void onEndTick(MinecraftServer server) {
		if (WATCHED.isEmpty()) {
			return;
		}
		eliteCulls = 0;
		Entity[] copy = WATCHED.toArray(Entity[]::new);
		for (Entity entity : copy) {
			if (!WATCHED.contains(entity) || entity.isRemoved() || !(entity.level() instanceof ServerLevel)) {
				WATCHED.remove(entity);
				continue;
			}
			tickOne(server, entity);
		}
	}

	private static void tickOne(MinecraftServer server, Entity entity) {
		Set<String> tags = entity.entityTags();
		EntityType<?> type = entity.getType();
		ServerLevel level = (ServerLevel) entity.level();
		if (is(level, type, CAN_BE_DANGER)) {
			tickDanger(server, entity, tags);
		} else if (type == EntityTypes.MARKER) {
			tickMarker(server, entity, tags);
		} else if (type == EntityTypes.IRON_GOLEM) {
			tickGolem(server, entity, tags);
		} else if (type == EntityTypes.WOLF) {
			if (tags.contains("overlimit.summon") && score(server, entity, "overlimit.summon.life") >= 1) {
				run(server, entity, "enchant/summon_wolf/life_tick");
			}
		} else if (is(level, type, ARROWS)) {
			if (!tags.contains("overlimit.gb_done")) {
				run(server, entity, "item/golden_bow/try_shot");
			}
			if (entity.entityTags().contains("overlimit.gb_done") || entity.isRemoved()) {
				WATCHED.remove(entity);
			}
		} else if (type == EntityTypes.TRIDENT) {
			tickTrident(server, entity, tags);
		} else if (type == EntityTypes.CAT) {
			run(server, entity, "enchant/cat_foot/discard_decoy");
			WATCHED.remove(entity);
		} else if (type == EntityTypes.ITEM_DISPLAY) {
			entity.kill(level);
			WATCHED.remove(entity);
		}
	}

	private static void tickDanger(MinecraftServer server, Entity entity, Set<String> tags) {
		if (eliteCulls < 16 && tags.contains("overlimit.elite") && !excludedElite(tags)) {
			eliteCulls++;
			run(server, entity, "mob/cull_world_elite");
			if (entity.isRemoved()) {
				WATCHED.remove(entity);
				return;
			}
			tags = entity.entityTags();
		}
		if (score(server, entity, "overlimit.bind.timer") >= 1) {
			run(server, entity, "enchant/chain_bind/tick_bound");
		}
		if (tags.contains("overlimit.summon") && score(server, entity, "overlimit.summon.life") >= 1) {
			run(server, entity, "enchant/summon_wolf/life_tick");
		}
		if (tags.contains("overlimit.necro")) {
			run(server, entity, "enchant/necromancy/aggro_tick");
		}
		if (entity.getType() == EntityTypes.CREEPER && tags.contains("overlimit.cat_pacify")) {
			run(server, entity, "enchant/cat_foot/pacify_tick");
		}
		if (tags.contains("overlimit.ul.para")) {
			run(server, entity, "item/unlimited/spear_para_tick");
		}
	}

	private static boolean excludedElite(Set<String> tags) {
		return tags.contains("overlimit.structure")
			|| tags.contains("overlimit.blood_moon")
			|| tags.contains("overlimit.no_wave")
			|| tags.contains("overlimit.nr_wave")
			|| tags.contains("overlimit.cc_wave")
			|| tags.contains("overlimit.summon")
			|| tags.contains("overlimit.necro");
	}

	private static void tickMarker(MinecraftServer server, Entity entity, Set<String> tags) {
		if (tags.contains("overlimit.elite_xp") || (tags.contains("overlimit.danger_xp") && !tags.contains("overlimit.elite_xp"))) {
			run(server, entity, "mob/xp_marker_tick");
		}
		if (entity.isRemoved()) {
			WATCHED.remove(entity);
			return;
		}
		tags = entity.entityTags();
		if (tags.contains("overlimit.hg_field")) {
			run(server, entity, "enchant/hyper_gravity/field_tick");
		}
		if (tags.contains("overlimit.ul.slash")) {
			run(server, entity, "item/unlimited/slash_tick");
		}
		if (tags.contains("overlimit.ul.tri_pin")) {
			if (entity.level() instanceof ServerLevel level) {
				entity.kill(level);
			}
			WATCHED.remove(entity);
		}
	}

	private static void tickGolem(MinecraftServer server, Entity entity, Set<String> tags) {
		if (!tags.contains("overlimit.mini_golem_ready")) {
			run(server, entity, "item/mini_golem/init");
			tags = entity.entityTags();
		}
		joinOverlimit(server, entity);
		if (!tags.contains("overlimit.mini_golem_gone")) {
			run(server, entity, "item/mini_golem/tick");
		}
		if (entity.isRemoved()) {
			WATCHED.remove(entity);
		}
	}

	private static void tickTrident(MinecraftServer server, Entity entity, Set<String> tags) {
		if (!tags.contains("overlimit.ul.tri_chk")) {
			run(server, entity, "item/unlimited/trident_mark");
			tags = entity.entityTags();
		}
		if (tags.contains("overlimit.ul.tri") && !tags.contains("overlimit.ul.tri_boom")) {
			run(server, entity, "item/unlimited/trident_try");
			tags = entity.entityTags();
		}
		if (tags.contains("overlimit.ul.tri")) {
			run(server, entity, "item/unlimited/trident_return");
			run(server, entity, "item/unlimited/trident_fx");
		} else if (tags.contains("overlimit.ul.tri_chk")) {
			WATCHED.remove(entity);
		}
	}

	private static void joinOverlimit(MinecraftServer server, Entity entity) {
		Scoreboard board = server.getScoreboard();
		PlayerTeam team = board.getPlayerTeam("overlimit");
		if (team == null) {
			return;
		}
		String name = entity.getScoreboardName();
		if (board.getPlayersTeam(name) != team) {
			board.addPlayerToTeam(name, team);
		}
	}

	private static int score(MinecraftServer server, Entity entity, String objective) {
		Objective obj = server.getScoreboard().getObjective(objective);
		if (obj == null) {
			return 0;
		}
		ReadOnlyScoreInfo info = server.getScoreboard().getPlayerScoreInfo(entity, obj);
		return info == null ? 0 : info.value();
	}

	static void run(MinecraftServer server, Entity entity, String path) {
		if (!(entity.level() instanceof ServerLevel level)) {
			return;
		}
		Identifier id = Identifier.fromNamespaceAndPath("overlimit", path);
		CommandFunction<CommandSourceStack> function = server.getFunctions().get(id).orElse(null);
		if (function == null) {
			if (MISSING.add(path)) {
				OverlimitMod.LOGGER.warn("Missing function overlimit:{}", path);
			}
			return;
		}
		CommandSourceStack source = server.getFunctions().getGameLoopSender()
			.withLevel(level)
			.withEntity(entity)
			.withPosition(entity.position())
			.withRotation(entity.getRotationVector())
			.withSuppressedOutput();
		try {
			server.getFunctions().execute(function, source);
		} catch (RuntimeException ex) {
			if (MISSING.add(path + "#err")) {
				OverlimitMod.LOGGER.warn("Hot tick function overlimit:{} failed", path, ex);
			}
		}
	}

	private static boolean shouldWatch(ServerLevel level, Entity entity) {
		EntityType<?> type = entity.getType();
		Set<String> tags = entity.entityTags();
		if (is(level, type, CAN_BE_DANGER)) {
			return true;
		}
		if (is(level, type, ARROWS)) {
			return !tags.contains("overlimit.gb_done");
		}
		if (type == EntityTypes.TRIDENT) {
			return tags.contains("overlimit.ul.tri") || !tags.contains("overlimit.ul.tri_chk");
		}
		if (type == EntityTypes.WOLF) {
			return tags.contains("overlimit.summon");
		}
		if (type == EntityTypes.IRON_GOLEM) {
			return tags.contains("overlimit.mini_golem");
		}
		if (type == EntityTypes.CAT) {
			return tags.contains("overlimit.cat_decoy");
		}
		if (type == EntityTypes.ITEM_DISPLAY) {
			return tags.contains("overlimit.ul.tri_vis");
		}
		if (type == EntityTypes.MARKER) {
			return tags.contains("overlimit.elite_xp")
				|| tags.contains("overlimit.danger_xp")
				|| tags.contains("overlimit.hg_field")
				|| tags.contains("overlimit.ul.slash")
				|| tags.contains("overlimit.ul.tri_pin");
		}
		return false;
	}

	private static boolean is(ServerLevel level, EntityType<?> type, TagKey<EntityType<?>> tag) {
		return level.registryAccess().lookupOrThrow(Registries.ENTITY_TYPE).wrapAsHolder(type).is(tag);
	}
}
