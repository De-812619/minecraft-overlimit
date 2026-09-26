package dev.de812619.overlimit;

import net.fabricmc.api.ModInitializer;
import net.fabricmc.fabric.api.event.lifecycle.v1.ServerEntityEvents;
import net.fabricmc.fabric.api.event.lifecycle.v1.ServerLifecycleEvents;
import net.fabricmc.fabric.api.event.lifecycle.v1.ServerTickEvents;
import net.fabricmc.fabric.api.resource.v1.pack.PackActivationType;
import net.fabricmc.fabric.impl.resource.ResourceLoaderImpl;
import net.fabricmc.loader.api.FabricLoader;
import net.minecraft.network.chat.Component;
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

	/** DnT 6.x の fabric.mod.json id。データパック単体の zip にはこの id は無い。 */
	private static final String DNT_MOD_ID = "mr_dungeons_andtaverns";

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
		registerDntBonusPack();
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

	/**
	 * DnT のチェスト上書きは {@code nova_structures} の改造やタグを参照する。
	 * 常時データパックに置くと、DnT が無い 26.3 ではロードに失敗する。
	 */
	private static void registerDntBonusPack() {
		if (!FabricLoader.getInstance().isModLoaded(DNT_MOD_ID)) {
			LOGGER.info("Dungeons and Taverns is not loaded; DnT chest bonus pack stays off");
			return;
		}
		boolean registered = FabricLoader.getInstance().getModContainer(MOD_ID).map(container ->
			ResourceLoaderImpl.registerBuiltinPack(
				Identifier.fromNamespaceAndPath(MOD_ID, "dnt"),
				"resourcepacks/dnt",
				container,
				Component.literal("Over Limit (Dungeons and Taverns)"),
				PackActivationType.ALWAYS_ENABLED
			)
		).orElse(false);
		if (registered) {
			LOGGER.info("Registered DnT chest bonus pack");
		} else {
			LOGGER.warn("Failed to register DnT chest bonus pack");
		}
	}
}
