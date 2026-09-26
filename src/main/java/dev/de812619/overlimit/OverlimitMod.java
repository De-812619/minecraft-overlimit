package dev.de812619.overlimit;

import net.fabricmc.api.ModInitializer;
import net.fabricmc.fabric.api.event.lifecycle.v1.ServerEntityEvents;
import net.fabricmc.fabric.api.event.lifecycle.v1.ServerLifecycleEvents;
import net.fabricmc.fabric.api.event.lifecycle.v1.ServerTickEvents;
import net.minecraft.core.registries.Registries;
import net.minecraft.resources.Identifier;
import net.minecraft.resources.ResourceKey;
import net.minecraft.server.MinecraftServer;
import net.minecraft.server.level.ServerLevel;
import net.minecraft.world.level.Level;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public final class OverlimitMod implements ModInitializer {
	public static final String MOD_ID = "overlimit";
	public static final Logger LOGGER = LoggerFactory.getLogger(MOD_ID);

	private static final ResourceKey<Level> BLOOD_WORLD = ResourceKey.create(
		Registries.DIMENSION,
		Identifier.fromNamespaceAndPath("overlimit", "blood_world")
	);

	/** ブラッドムーン中のその次元だけ、敵対の自然湧きを止める。 */
	public static boolean blockMonsterSpawns(ServerLevel level) {
		MinecraftServer server = level.getServer();
		ResourceKey<Level> dimension = level.dimension();
		if (dimension == Level.OVERWORLD) {
			return Scores.get(server, "#bm_active") == 1;
		}
		if (dimension == BLOOD_WORLD) {
			return Scores.get(server, "#bw_active") == 1;
		}
		return false;
	}

	@Override
	public void onInitialize() {
		ServerEntityEvents.ENTITY_LOAD.register(HotTick::onLoad);
		ServerEntityEvents.ENTITY_LOAD.register(MobRank::onLoad);
		ServerEntityEvents.ENTITY_UNLOAD.register(HotTick::onUnload);
		ServerEntityEvents.ENTITY_UNLOAD.register(MobRank::onUnload);
		ServerTickEvents.END_SERVER_TICK.register(MobRank::onEndTick);
		ServerTickEvents.END_SERVER_TICK.register(HotTick::onEndTick);
		ServerTickEvents.END_SERVER_TICK.register(NetherizeRows::onEndTick);
		ServerLifecycleEvents.SERVER_STOPPED.register(server -> {
			HotTick.clear();
			MobRank.clear();
		});
		SkyWalk.register();
		HyperDig.register();
		AstralFlow.register();
		CatFoot.register();
		PlayerHeal.register();
		TrimQuartz.register();
		TrimResin.register();
		TrimGold.register();
		TrimArmor.register();
		Clairvoyance.register();
		PlayerPulse.register();
		Attrition.register();
		BloodWorldWeather.register();
		PortalGate.register();
		OverlimitCommands.register();
		LOGGER.info("Overlimit phase 11: rank mobs when they load, attrition on combat damage");
	}
}
