package dev.de812619.overlimit;

import net.fabricmc.fabric.api.event.lifecycle.v1.ServerTickEvents;
import net.minecraft.resources.Identifier;
import net.minecraft.server.MinecraftServer;
import net.minecraft.server.level.ServerLevel;
import net.minecraft.server.level.ServerPlayer;
import net.minecraft.world.entity.Entity;
import net.minecraft.world.entity.EntityTypes;
import net.minecraft.world.entity.EquipmentSlot;
import net.minecraft.world.entity.ai.attributes.AttributeInstance;
import net.minecraft.world.entity.ai.attributes.AttributeModifier;
import net.minecraft.world.entity.ai.attributes.Attributes;
import net.minecraft.world.item.ItemStack;
import net.minecraft.world.phys.AABB;

/**
 * 猫足：地面にいるときのみジャンプ力 +0.2。
 * クリーパー沈静は 4 tick に 1 回、装備者の周囲だけを見る。復帰は沈静タグ付き個体だけ。
 */
final class CatFoot {
	private static final Identifier ENCHANT_ID =
		Identifier.fromNamespaceAndPath("overlimit", "cat_foot");
	private static final Identifier MODIFIER_ID =
		Identifier.fromNamespaceAndPath("overlimit", "cat_foot_jump");
	private static final double PACIFY_RANGE_SQ = 16.0 * 16.0;
	private static final String SUMMON_TAG = "overlimit.summon";
	private static final String PACIFY_TAG = "overlimit.cat_pacify";

	private static final double JUMP_BOOST = 0.2;

	private CatFoot() {
	}

	static void register() {
		ServerTickEvents.END_SERVER_TICK.register(CatFoot::onTick);
	}

	private static void onTick(MinecraftServer server) {
		for (ServerPlayer player : server.getPlayerList().getPlayers()) {
			ItemStack boots = player.getItemBySlot(EquipmentSlot.FEET);
			boolean hasEnchant = SkyWalk.hasEnchant(boots, ENCHANT_ID);

			AttributeInstance attr = player.getAttribute(Attributes.JUMP_STRENGTH);
			if (attr == null) continue;

			if (!hasEnchant) {
				// 靴を外したら即削除
				removeModifier(attr);
				continue;
			}

			// 本物の地面にいるときだけ付与（空中では外す）
			if (player.onGround()) {
				if (!attr.hasModifier(MODIFIER_ID)) {
					attr.addOrUpdateTransientModifier(
						new AttributeModifier(MODIFIER_ID, JUMP_BOOST, AttributeModifier.Operation.ADD_VALUE)
					);
				}
			} else {
				removeModifier(attr);
			}
		}
		pacifyCreepers(server);
	}

	private static void pacifyCreepers(MinecraftServer server) {
		long time = server.overworld().getGameTime();
		if ((time & 3L) == 0L) {
			for (ServerPlayer player : server.getPlayerList().getPlayers()) {
				if (!SkyWalk.hasEnchant(player.getItemBySlot(EquipmentSlot.FEET), ENCHANT_ID)) {
					continue;
				}
				if (!(player.level() instanceof ServerLevel level)) {
					continue;
				}
				AABB box = player.getBoundingBox().inflate(16.0);
				for (Entity entity : level.getEntities(player, box, CatFoot::isPacifyTarget)) {
					if (player.distanceToSqr(entity) <= PACIFY_RANGE_SQ) {
						HotTick.run(server, entity, "enchant/cat_foot/pacify");
					}
				}
			}
		}
		for (Entity entity : HotTick.snapshot()) {
			if (entity.getType() == EntityTypes.CREEPER && entity.entityTags().contains(PACIFY_TAG) && !entity.isRemoved()) {
				HotTick.run(server, entity, "enchant/cat_foot/pacify_tick");
			}
		}
	}

	private static boolean isPacifyTarget(Entity entity) {
		return entity.getType() == EntityTypes.CREEPER && !entity.entityTags().contains(SUMMON_TAG);
	}

	private static void removeModifier(AttributeInstance attr) {
		AttributeModifier existing = attr.getModifier(MODIFIER_ID);
		if (existing != null) {
			attr.removeModifier(existing);
		}
	}
}
