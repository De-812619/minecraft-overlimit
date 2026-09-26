package dev.de812619.overlimit;

import net.fabricmc.fabric.api.event.lifecycle.v1.ServerTickEvents;
import net.minecraft.core.registries.Registries;
import net.minecraft.resources.Identifier;
import net.minecraft.server.MinecraftServer;
import net.minecraft.server.level.ServerLevel;
import net.minecraft.server.level.ServerPlayer;
import net.minecraft.tags.TagKey;
import net.minecraft.world.entity.Entity;
import net.minecraft.world.entity.EntityType;
import net.minecraft.world.entity.LivingEntity;
import net.minecraft.world.entity.ai.attributes.AttributeInstance;
import net.minecraft.world.entity.ai.attributes.AttributeModifier;
import net.minecraft.world.entity.ai.attributes.Attributes;
import net.minecraft.world.entity.projectile.ProjectileUtil;
import net.minecraft.world.level.ClipContext;
import net.minecraft.world.phys.AABB;
import net.minecraft.world.phys.BlockHitResult;
import net.minecraft.world.phys.EntityHitResult;
import net.minecraft.world.phys.HitResult;
import net.minecraft.world.phys.Vec3;

import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.Map;
import java.util.Set;
import java.util.UUID;

/**
 * 樹脂: 水平速度ベースの静止防御と、レイキャスト視線での移動停止。
 */
final class TrimResin {
	private static final String SET_TAG = "overlimit.trim.set.resin";
	private static final String LOOK_STOP_TAG = "overlimit.trim.look_stop";
	private static final String SUMMON_TAG = "overlimit.summon";
	private static final String RESIN_SCORE = "overlimit.trim.resin";
	private static final Identifier ARMOR_MOD =
		Identifier.fromNamespaceAndPath("overlimit", "trim.resin.armor");
	private static final Identifier LOOK_MOD =
		Identifier.fromNamespaceAndPath("overlimit", "trim.resin.look");
	private static final TagKey<EntityType<?>> LOOK_STOP = TagKey.create(
		Registries.ENTITY_TYPE,
		Identifier.fromNamespaceAndPath("overlimit", "trim_look_stop")
	);
	private static final double STILL_EPSILON_SQ = 1.0e-6;
	private static final double LOOK_RANGE = 12.0;
	private static final int LOOK_LINGER_TICKS = 5;

	/** 視線停止中エンティティ → 残り linger tick。 */
	private static final Map<UUID, Integer> lookLinger = new HashMap<>();

	private TrimResin() {
	}

	static void register() {
		ServerTickEvents.END_SERVER_TICK.register(TrimResin::onEndTick);
	}

	private static void onEndTick(MinecraftServer server) {
		Set<UUID> refreshed = new HashSet<>();

		for (ServerPlayer player : server.getPlayerList().getPlayers()) {
			updateStillArmor(player);
			if (player.entityTags().contains(SET_TAG) && player.level() instanceof ServerLevel level) {
				LivingEntity hit = rayLookTarget(player, level);
				if (hit != null) {
					applyLookStop(hit);
					refreshed.add(hit.getUUID());
				}
			}
		}

		tickLinger(server, refreshed);
	}

	private static void updateStillArmor(ServerPlayer player) {
		AttributeInstance attr = player.getAttribute(Attributes.ARMOR);
		if (attr == null) return;

		int pieces = Scores.getPlayer(player, RESIN_SCORE);
		boolean still = pieces > 0 && isStill(player);
		if (still) {
			double amount = 0.5 * pieces;
			attr.addOrUpdateTransientModifier(
				new AttributeModifier(ARMOR_MOD, amount, AttributeModifier.Operation.ADD_VALUE)
			);
		} else {
			attr.removeModifier(ARMOR_MOD);
		}
	}

	private static boolean isStill(ServerPlayer player) {
		if (!player.onGround()) return false;
		if (player.isPassenger()) return false;
		Vec3 delta = player.getDeltaMovement();
		double horizSq = delta.x * delta.x + delta.z * delta.z;
		return horizSq <= STILL_EPSILON_SQ;
	}

	private static LivingEntity rayLookTarget(ServerPlayer player, ServerLevel level) {
		Vec3 start = player.getEyePosition();
		Vec3 look = player.getLookAngle();
		Vec3 end = start.add(look.scale(LOOK_RANGE));

		BlockHitResult blockHit = level.clip(new ClipContext(
			start, end, ClipContext.Block.COLLIDER, ClipContext.Fluid.NONE, player
		));
		double maxDist = blockHit.getType() == HitResult.Type.MISS
			? LOOK_RANGE
			: start.distanceTo(blockHit.getLocation());
		Vec3 clipEnd = start.add(look.scale(maxDist));

		AABB search = player.getBoundingBox().expandTowards(look.scale(maxDist)).inflate(1.0);
		EntityHitResult entityHit = ProjectileUtil.getEntityHitResult(
			player,
			start,
			clipEnd,
			search,
			entity -> entity instanceof LivingEntity
				&& entity.getType().builtInRegistryHolder().is(LOOK_STOP)
				&& !entity.entityTags().contains(SUMMON_TAG)
				&& entity.isAlive(),
			maxDist * maxDist
		);
		if (entityHit == null) return null;
		Entity hit = entityHit.getEntity();
		return hit instanceof LivingEntity living ? living : null;
	}

	private static void applyLookStop(LivingEntity entity) {
		AttributeInstance speed = entity.getAttribute(Attributes.MOVEMENT_SPEED);
		if (speed == null) return;
		speed.addOrUpdateTransientModifier(
			new AttributeModifier(LOOK_MOD, -1.0, AttributeModifier.Operation.ADD_MULTIPLIED_TOTAL)
		);
		entity.addTag(LOOK_STOP_TAG);
		lookLinger.put(entity.getUUID(), LOOK_LINGER_TICKS);
	}

	private static void tickLinger(MinecraftServer server, Set<UUID> refreshed) {
		Iterator<Map.Entry<UUID, Integer>> it = lookLinger.entrySet().iterator();
		while (it.hasNext()) {
			Map.Entry<UUID, Integer> entry = it.next();
			UUID id = entry.getKey();
			if (refreshed.contains(id)) {
				entry.setValue(LOOK_LINGER_TICKS);
				continue;
			}
			int next = entry.getValue() - 1;
			if (next > 0) {
				entry.setValue(next);
				continue;
			}
			it.remove();
			clearLookStop(server, id);
		}
	}

	private static void clearLookStop(MinecraftServer server, UUID id) {
		for (ServerLevel level : server.getAllLevels()) {
			Entity entity = level.getEntity(id);
			if (!(entity instanceof LivingEntity living)) continue;
			AttributeInstance speed = living.getAttribute(Attributes.MOVEMENT_SPEED);
			if (speed != null) {
				speed.removeModifier(LOOK_MOD);
			}
			living.removeTag(LOOK_STOP_TAG);
			return;
		}
	}
}
