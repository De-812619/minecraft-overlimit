package dev.de812619.overlimit;

import net.fabricmc.fabric.api.event.lifecycle.v1.ServerTickEvents;
import net.minecraft.resources.Identifier;
import net.minecraft.server.MinecraftServer;
import net.minecraft.server.level.ServerPlayer;
import net.minecraft.world.entity.EquipmentSlot;
import net.minecraft.world.entity.ai.attributes.AttributeInstance;
import net.minecraft.world.entity.ai.attributes.AttributeModifier;
import net.minecraft.world.entity.ai.attributes.Attributes;
import net.minecraft.world.item.ItemStack;

/**
 * 猫足：地面にいるときのみジャンプ力 +0.2 の属性モディファイアを付与する。
 * 旧実装の strip_old_jump / sync_jump 二重呼び出しを廃止し、毎 tick end で直接管理する。
 * クリーパー沈静は既存の cat_foot/tick.mcfunction のまま。
 */
final class CatFoot {
	private static final Identifier ENCHANT_ID =
		Identifier.fromNamespaceAndPath("overlimit", "cat_foot");
	private static final Identifier MODIFIER_ID =
		Identifier.fromNamespaceAndPath("overlimit", "cat_foot_jump");
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
	}

	private static void removeModifier(AttributeInstance attr) {
		AttributeModifier existing = attr.getModifier(MODIFIER_ID);
		if (existing != null) {
			attr.removeModifier(existing);
		}
	}
}
