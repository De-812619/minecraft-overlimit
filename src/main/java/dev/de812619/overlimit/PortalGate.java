package dev.de812619.overlimit;

import net.fabricmc.fabric.api.event.lifecycle.v1.ServerEntityEvents;
import net.fabricmc.fabric.api.event.lifecycle.v1.ServerLifecycleEvents;
import net.fabricmc.fabric.api.event.lifecycle.v1.ServerTickEvents;
import net.minecraft.core.BlockPos;
import net.minecraft.core.Direction;
import net.minecraft.server.MinecraftServer;
import net.minecraft.server.level.ServerLevel;
import net.minecraft.server.level.ServerPlayer;
import net.minecraft.world.entity.Entity;
import net.minecraft.world.entity.EntityTypes;
import net.minecraft.world.phys.AABB;

import java.util.Collections;
import java.util.IdentityHashMap;
import java.util.Set;

/**
 * 泣く黒曜石の門マーカー。枠が壊れたら消し、内側が空ならネザーポータルを置く。
 * 立ち位置と転送はバニラのポータル処理。行き先は {@link BloodGates}。
 */
final class PortalGate {
	private static final String PORTAL = "overlimit.bw_portal";
	private static final String PORTAL_X = "overlimit.bw_portal_x";
	private static final String VIS = "overlimit.bw_vis";
	private static final String HELD = "overlimit.portal_held";
	private static final String ARRIVE = "overlimit.portal_arrive";
	private static final String CHARGE = "overlimit.portal_charge";

	private static final Set<Entity> PORTALS = Collections.newSetFromMap(new IdentityHashMap<>());

	private PortalGate() {
	}

	static void register() {
		ServerEntityEvents.ENTITY_LOAD.register(PortalGate::onLoad);
		ServerEntityEvents.ENTITY_UNLOAD.register(PortalGate::onUnload);
		ServerTickEvents.END_SERVER_TICK.register(PortalGate::onEndTick);
		ServerLifecycleEvents.SERVER_STOPPED.register(server -> PORTALS.clear());
	}

	private static void onLoad(Entity entity, ServerLevel world) {
		if (entity.getType() == EntityTypes.MARKER && entity.entityTags().contains(PORTAL)) {
			PORTALS.add(entity);
		}
	}

	private static void onUnload(Entity entity, ServerLevel world) {
		PORTALS.remove(entity);
	}

	private static void onEndTick(MinecraftServer server) {
		releaseOldCharge(server);
		if (PORTALS.isEmpty() || (server.getTickCount() & 3) != 0) {
			return;
		}
		Entity[] copy = PORTALS.toArray(Entity[]::new);
		for (Entity portal : copy) {
			if (!PORTALS.contains(portal) || portal.isRemoved() || !(portal.level() instanceof ServerLevel level)) {
				PORTALS.remove(portal);
				continue;
			}
			boolean axisX = portal.entityTags().contains(PORTAL_X);
			boolean axisZ = portal.entityTags().contains("overlimit.bw_portal_z");
			if (!axisX && !axisZ) {
				continue;
			}
			Direction.Axis axis = axisX ? Direction.Axis.X : Direction.Axis.Z;
			BlockPos origin = BlockPos.containing(portal.position());
			if (!BloodGates.cryingFrame(level, origin, axis)) {
				HotTick.run(server, portal, axisX ? "portal/break_x" : "portal/break_z");
				if (portal.isRemoved()) {
					PORTALS.remove(portal);
				}
				continue;
			}
			if (!BloodGates.interiorIsPortal(level, origin, axis)) {
				BloodGates.placeInterior(level, origin, axis);
				discardDisplays(level, origin);
			}
		}
	}

	/** 旧仕様の溜め（減速・吐き気）が残っていたら外す。 */
	private static void releaseOldCharge(MinecraftServer server) {
		for (ServerPlayer player : server.getPlayerList().getPlayers()) {
			if (player.entityTags().contains(HELD) && !player.entityTags().contains(ARRIVE)) {
				HotTick.run(server, player, "portal/release");
			}
			if (Scores.getPlayer(player, CHARGE) >= 1) {
				Scores.setPlayer(player, CHARGE, 0);
			}
		}
	}

	private static void discardDisplays(ServerLevel level, BlockPos origin) {
		AABB box = new AABB(origin).inflate(5.0);
		for (Entity entity : level.getEntities((Entity) null, box, PortalGate::isVis)) {
			entity.discard();
		}
	}

	private static boolean isVis(Entity entity) {
		return entity.getType() == EntityTypes.BLOCK_DISPLAY && entity.entityTags().contains(VIS);
	}
}
