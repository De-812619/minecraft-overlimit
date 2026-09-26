package dev.de812619.overlimit;

import net.fabricmc.fabric.api.event.lifecycle.v1.ServerEntityEvents;
import net.fabricmc.fabric.api.event.lifecycle.v1.ServerLifecycleEvents;
import net.fabricmc.fabric.api.event.lifecycle.v1.ServerTickEvents;
import net.minecraft.core.BlockPos;
import net.minecraft.core.component.DataComponents;
import net.minecraft.resources.Identifier;
import net.minecraft.server.MinecraftServer;
import net.minecraft.server.level.ServerLevel;
import net.minecraft.server.level.ServerPlayer;
import net.minecraft.world.effect.MobEffectInstance;
import net.minecraft.world.effect.MobEffects;
import net.minecraft.world.entity.Entity;
import net.minecraft.world.entity.EntityTypes;
import net.minecraft.world.entity.EquipmentSlot;
import net.minecraft.world.item.ItemStack;
import net.minecraft.world.item.equipment.trim.ArmorTrim;
import net.minecraft.world.phys.AABB;

import java.util.Arrays;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.Map;
import java.util.Set;
import java.util.UUID;

/**
 * トリム枚数は防具が変わったときだけ数え、属性の付け直しは差分のときだけ行う。
 * 暗視・暗闇解除・エメラルドオーラ・スコア減衰は装備者だけを 2 tick ごとに見る。
 */
final class TrimArmor {
	private static final String[] MATERIALS = {
		"iron", "gold", "diamond", "netherite", "copper", "redstone",
		"lapis", "emerald", "amethyst", "quartz", "resin"
	};
	private static final EquipmentSlot[] ARMOR = {
		EquipmentSlot.HEAD, EquipmentSlot.CHEST, EquipmentSlot.LEGS, EquipmentSlot.FEET
	};
	private static final String AURA = "overlimit.trim.em_aura";
	private static final String AMY_NV = "overlimit.trim.amy_nv";
	private static final double AURA_RANGE_SQ = 8.0 * 8.0;
	private static final int NV_TICKS = 15 * 20;

	private static final Map<UUID, int[]> LAST = new HashMap<>();
	private static final Set<UUID> AURA_MOBS = new HashSet<>();

	private TrimArmor() {
	}

	static void register() {
		ServerTickEvents.END_SERVER_TICK.register(TrimArmor::onEndTick);
		ServerEntityEvents.ENTITY_LOAD.register(TrimArmor::onLoad);
		ServerLifecycleEvents.SERVER_STOPPED.register(server -> {
			LAST.clear();
			AURA_MOBS.clear();
		});
	}

	private static void onLoad(Entity entity, ServerLevel world) {
		if (entity.entityTags().contains(AURA) && isIllager(entity)) {
			AURA_MOBS.add(entity.getUUID());
		}
	}

	private static void onEndTick(MinecraftServer server) {
		long time = server.overworld().getGameTime();
		if ((time & 1L) != 0L) {
			return;
		}
		boolean tenth = time % 10L == 0L;
		Set<UUID> nearAura = new HashSet<>();
		for (ServerPlayer player : server.getPlayerList().getPlayers()) {
			int[] counts = countArmor(player);
			int[] previous = LAST.get(player.getUUID());
			if (previous == null || !Arrays.equals(previous, counts)) {
				LAST.put(player.getUUID(), counts);
				writeCounts(player, counts);
				HotTick.run(server, player, "trim/apply");
			}
			if (!player.entityTags().contains("overlimit.trim.set.amethyst")
				&& player.entityTags().contains(AMY_NV)) {
				clearNightVision(player);
			}
			if (player.entityTags().contains("overlimit.trim.set.emerald")
				&& player.level() instanceof ServerLevel level) {
				markAura(server, level, player, nearAura);
			}
			if (player.entityTags().contains("overlimit.trim.set.amethyst")
				&& player.level() instanceof ServerLevel level) {
				tickAmethyst(level, player);
			}
			if (tenth && player.entityTags().contains("overlimit.trim.set.gold")) {
				HotTick.run(server, player, "trim/gold/equip_calm");
			}
			tickScores(server, player);
			if (tenth) {
				resetMove(player);
			}
		}
		expireAura(server, nearAura);
	}

	private static int[] countArmor(ServerPlayer player) {
		int[] counts = new int[MATERIALS.length];
		for (EquipmentSlot slot : ARMOR) {
			String material = materialPath(player.getItemBySlot(slot));
			if (material == null) {
				continue;
			}
			for (int i = 0; i < MATERIALS.length; i++) {
				if (MATERIALS[i].equals(material)) {
					counts[i]++;
					break;
				}
			}
		}
		return counts;
	}

	private static String materialPath(ItemStack stack) {
		ArmorTrim trim = stack.get(DataComponents.TRIM);
		if (trim == null) {
			return null;
		}
		return trim.material().unwrapKey().map(key -> {
			Identifier id = key.identifier();
			return "minecraft".equals(id.getNamespace()) ? id.getPath() : null;
		}).orElse(null);
	}

	private static void writeCounts(ServerPlayer player, int[] counts) {
		for (int i = 0; i < MATERIALS.length; i++) {
			Scores.setPlayer(player, "overlimit.trim." + MATERIALS[i], counts[i]);
			String tag = "overlimit.trim.set." + MATERIALS[i];
			if (counts[i] >= 3) {
				player.addTag(tag);
			} else {
				player.removeTag(tag);
			}
		}
	}

	private static void markAura(MinecraftServer server, ServerLevel level, ServerPlayer player, Set<UUID> near) {
		AABB box = player.getBoundingBox().inflate(8.0);
		for (Entity entity : level.getEntities(player, box, TrimArmor::isIllager)) {
			if (player.distanceToSqr(entity) > AURA_RANGE_SQ) {
				continue;
			}
			HotTick.run(server, entity, "trim/emerald/apply_one");
			AURA_MOBS.add(entity.getUUID());
			near.add(entity.getUUID());
		}
	}

	private static void expireAura(MinecraftServer server, Set<UUID> near) {
		Iterator<UUID> it = AURA_MOBS.iterator();
		while (it.hasNext()) {
			UUID id = it.next();
			if (near.contains(id)) {
				continue;
			}
			Entity entity = find(server, id);
			if (entity == null || entity.isRemoved() || !entity.entityTags().contains(AURA)) {
				it.remove();
				continue;
			}
			if (emeraldPlayerNear(entity)) {
				continue;
			}
			HotTick.run(server, entity, "trim/emerald/expire");
			if (!entity.entityTags().contains(AURA)) {
				it.remove();
			}
		}
	}

	private static boolean emeraldPlayerNear(Entity entity) {
		if (!(entity.level() instanceof ServerLevel level)) {
			return false;
		}
		for (ServerPlayer player : level.players()) {
			if (player.entityTags().contains("overlimit.trim.set.emerald")
				&& player.distanceToSqr(entity) <= AURA_RANGE_SQ) {
				return true;
			}
		}
		return false;
	}

	private static Entity find(MinecraftServer server, UUID id) {
		for (ServerLevel level : server.getAllLevels()) {
			Entity entity = level.getEntity(id);
			if (entity != null) {
				return entity;
			}
		}
		return null;
	}

	private static void tickAmethyst(ServerLevel level, ServerPlayer player) {
		if (player.hasEffect(MobEffects.DARKNESS)) {
			player.removeEffect(MobEffects.DARKNESS);
		}
		if (player.hasEffect(MobEffects.BLINDNESS)) {
			player.removeEffect(MobEffects.BLINDNESS);
		}
		BlockPos pos = player.blockPosition();
		int light = level.getLightEngine().getRawBrightness(pos, level.getSkyDarken());
		if (light <= 7) {
			MobEffectInstance current = player.getEffect(MobEffects.NIGHT_VISION);
			if (current == null || current.getDuration() < 40) {
				player.addEffect(new MobEffectInstance(MobEffects.NIGHT_VISION, NV_TICKS, 0, false, false));
			}
			player.addTag(AMY_NV);
		} else if (player.entityTags().contains(AMY_NV)) {
			clearNightVision(player);
		}
	}

	private static void clearNightVision(ServerPlayer player) {
		player.removeEffect(MobEffects.NIGHT_VISION);
		player.removeTag(AMY_NV);
	}

	private static void tickScores(MinecraftServer server, ServerPlayer player) {
		int anger = Scores.getPlayer(player, "overlimit.trim.anger");
		if (anger >= 1) {
			Scores.setPlayer(player, "overlimit.trim.anger", anger - 2);
		}
		if (Scores.getPlayer(player, "overlimit.trim.cu_hits") >= 1) {
			int age = Scores.getPlayer(player, "overlimit.trim.cu_age") + 2;
			Scores.setPlayer(player, "overlimit.trim.cu_age", age);
			if (age >= 200) {
				HotTick.run(server, player, "trim/copper/reset_hits");
			}
		}
		int amy = Scores.getPlayer(player, "overlimit.trim.amy_cd");
		if (amy >= 1) {
			Scores.setPlayer(player, "overlimit.trim.amy_cd", amy - 2);
		}
	}

	private static void resetMove(ServerPlayer player) {
		Scores.setPlayer(player, "overlimit.trim.walk", 0);
		Scores.setPlayer(player, "overlimit.trim.sprint", 0);
		Scores.setPlayer(player, "overlimit.trim.crouch", 0);
		Scores.setPlayer(player, "overlimit.trim.swim", 0);
		Scores.setPlayer(player, "overlimit.trim.fly", 0);
		Scores.setPlayer(player, "overlimit.trim.climb", 0);
		Scores.setPlayer(player, "overlimit.trim.fall", 0);
		Scores.setPlayer(player, "overlimit.trim.horse", 0);
		Scores.setPlayer(player, "overlimit.trim.boat", 0);
	}

	private static boolean isIllager(Entity entity) {
		var type = entity.getType();
		return type == EntityTypes.EVOKER
			|| type == EntityTypes.ILLUSIONER
			|| type == EntityTypes.PILLAGER
			|| type == EntityTypes.RAVAGER
			|| type == EntityTypes.VEX
			|| type == EntityTypes.VINDICATOR
			|| type == EntityTypes.WITCH;
	}
}
