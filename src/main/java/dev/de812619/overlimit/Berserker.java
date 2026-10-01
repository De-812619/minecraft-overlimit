package dev.de812619.overlimit;

import net.fabricmc.fabric.api.event.lifecycle.v1.ServerLifecycleEvents;
import net.fabricmc.fabric.api.event.lifecycle.v1.ServerTickEvents;
import net.minecraft.resources.Identifier;
import net.minecraft.server.MinecraftServer;
import net.minecraft.server.level.ServerPlayer;
import net.minecraft.util.Mth;
import net.minecraft.world.entity.EquipmentSlot;
import net.minecraft.world.entity.ai.attributes.AttributeInstance;
import net.minecraft.world.entity.ai.attributes.AttributeModifier;
import net.minecraft.world.entity.ai.attributes.Attributes;

import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

/**
 * バーサーカー：最大HPに対する欠損割合だけ近接攻撃力が上がる。
 * 欠損1%につき +1%、上限 +50%。吸収ハートは見ない。変化したときだけ付け替える。
 */
final class Berserker {
	private static final Identifier ENCHANT_ID =
		Identifier.fromNamespaceAndPath("overlimit", "berserker");
	private static final Identifier MODIFIER_ID =
		Identifier.fromNamespaceAndPath("overlimit", "berserker.atk");
	private static final int MAX_BONUS_PCT = 50;

	private static final Map<UUID, Integer> LAST_PCT = new HashMap<>();

	private Berserker() {
	}

	static void register() {
		ServerTickEvents.END_SERVER_TICK.register(Berserker::onTick);
		ServerLifecycleEvents.SERVER_STOPPED.register(server -> LAST_PCT.clear());
	}

	private static void onTick(MinecraftServer server) {
		for (ServerPlayer player : server.getPlayerList().getPlayers()) {
			tickPlayer(player);
		}
	}

	private static void tickPlayer(ServerPlayer player) {
		UUID id = player.getUUID();
		AttributeInstance attr = player.getAttribute(Attributes.ATTACK_DAMAGE);
		if (attr == null) {
			return;
		}
		if (!SkyWalk.hasEnchant(player.getItemBySlot(EquipmentSlot.CHEST), ENCHANT_ID)) {
			if (LAST_PCT.remove(id) != null) {
				attr.removeModifier(MODIFIER_ID);
			}
			return;
		}

		double max = player.getMaxHealth();
		int pct = 0;
		if (max > 0.0) {
			double missing = 1.0 - (player.getHealth() / max);
			pct = Mth.clamp((int) Math.floor(missing * 100.0), 0, MAX_BONUS_PCT);
		}
		if (LAST_PCT.getOrDefault(id, -1) == pct) {
			return;
		}
		LAST_PCT.put(id, pct);
		if (pct <= 0) {
			attr.removeModifier(MODIFIER_ID);
			return;
		}
		attr.addOrUpdateTransientModifier(new AttributeModifier(
			MODIFIER_ID,
			pct / 100.0,
			AttributeModifier.Operation.ADD_MULTIPLIED_BASE
		));
	}
}
