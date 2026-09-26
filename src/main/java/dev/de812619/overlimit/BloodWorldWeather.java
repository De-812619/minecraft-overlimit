package dev.de812619.overlimit;

import net.fabricmc.fabric.api.event.lifecycle.v1.ServerTickEvents;
import net.minecraft.core.registries.Registries;
import net.minecraft.network.protocol.game.ClientboundGameEventPacket;
import net.minecraft.resources.Identifier;
import net.minecraft.resources.ResourceKey;
import net.minecraft.server.level.ServerLevel;
import net.minecraft.server.players.PlayerList;
import net.minecraft.world.level.Level;

/**
 * 26.3 の天候データはサーバー全体で一つ。ブラッドワールドの雨レベルだけを 0 に戻す。
 * オーバーワールドの雨はそのまま。誰もいないあいだも、このディメンションの雨は溜めない。
 */
final class BloodWorldWeather {
	private static final ResourceKey<Level> BLOOD_WORLD = ResourceKey.create(
		Registries.DIMENSION,
		Identifier.fromNamespaceAndPath("overlimit", "blood_world")
	);

	private BloodWorldWeather() {
	}

	static void register() {
		ServerTickEvents.END_LEVEL_TICK.register(BloodWorldWeather::onEndWorldTick);
	}

	private static void onEndWorldTick(ServerLevel level) {
		if (level.dimension() != BLOOD_WORLD) {
			return;
		}
		float rain = level.getRainLevel(1.0F);
		float thunder = level.getThunderLevel(1.0F);
		if (rain <= 0.0F && thunder <= 0.0F) {
			return;
		}
		boolean wasRaining = level.isRaining();
		level.setRainLevel(0.0F);
		level.setThunderLevel(0.0F);
		if (level.players().isEmpty()) {
			return;
		}
		PlayerList players = level.getServer().getPlayerList();
		ResourceKey<Level> dimension = level.dimension();
		players.broadcastAll(new ClientboundGameEventPacket(ClientboundGameEventPacket.RAIN_LEVEL_CHANGE, 0.0F), dimension);
		players.broadcastAll(new ClientboundGameEventPacket(ClientboundGameEventPacket.THUNDER_LEVEL_CHANGE, 0.0F), dimension);
		if (wasRaining) {
			players.broadcastAll(new ClientboundGameEventPacket(ClientboundGameEventPacket.STOP_RAINING, 0.0F), dimension);
		}
	}
}
