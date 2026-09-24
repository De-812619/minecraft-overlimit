package dev.de812619.overlimit;

import net.fabricmc.api.ModInitializer;
import net.fabricmc.fabric.api.event.lifecycle.v1.ServerEntityEvents;
import net.fabricmc.fabric.api.event.lifecycle.v1.ServerLifecycleEvents;
import net.fabricmc.fabric.api.event.lifecycle.v1.ServerTickEvents;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public final class OverlimitMod implements ModInitializer {
	public static final String MOD_ID = "overlimit";
	public static final Logger LOGGER = LoggerFactory.getLogger(MOD_ID);

	@Override
	public void onInitialize() {
		ServerEntityEvents.ENTITY_LOAD.register(HotTick::onLoad);
		ServerEntityEvents.ENTITY_UNLOAD.register(HotTick::onUnload);
		ServerTickEvents.END_SERVER_TICK.register(HotTick::onEndTick);
		ServerTickEvents.END_SERVER_TICK.register(NetherizeRows::onEndTick);
		ServerLifecycleEvents.SERVER_STOPPED.register(server -> HotTick.clear());
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
		BloodWorldWeather.register();
		PortalGate.register();
		OverlimitCommands.register();
		LOGGER.info("Overlimit phase 10: crying obsidian portals travel like nether portals");
	}
}
