package dev.de812619.overlimit;

import net.fabricmc.fabric.api.command.v2.CommandRegistrationCallback;
import net.minecraft.commands.CommandSourceStack;
import net.minecraft.commands.Commands;
import net.minecraft.server.permissions.Permissions;

final class OverlimitCommands {
	private OverlimitCommands() {
	}

	static void register() {
		CommandRegistrationCallback.EVENT.register((dispatcher, registryAccess, environment) -> dispatcher.register(
			Commands.literal("overlimit")
				.requires(OverlimitCommands::canRun)
				.then(Commands.literal("near_light").executes(SpawnLights::scan))
				.then(Commands.literal("bm_count").executes(EventMobs::count))
				.then(Commands.literal("event_mobs")
					.then(Commands.literal("ow_credit").executes(EventMobs::owCredit))
					.then(Commands.literal("bw_credit").executes(EventMobs::bwCredit))
					.then(Commands.literal("ow_ranks").executes(EventMobs::owRanks))
					.then(Commands.literal("bw_ranks").executes(EventMobs::bwRanks))
					.then(Commands.literal("ow_cull").executes(EventMobs::owCull))
					.then(Commands.literal("bw_cull").executes(EventMobs::bwCull))
					.then(Commands.literal("no_anger").executes(EventMobs::noAnger))
					.then(Commands.literal("no_glow").executes(EventMobs::noGlow))
					.then(Commands.literal("no_unglow").executes(EventMobs::noUnglow))
					.then(Commands.literal("no_cull").executes(EventMobs::noCull))
					.then(Commands.literal("nr_anger").executes(EventMobs::nrAnger))
					.then(Commands.literal("nr_glow").executes(EventMobs::nrGlow))
					.then(Commands.literal("nr_unglow").executes(EventMobs::nrUnglow))
					.then(Commands.literal("nr_cull").executes(EventMobs::nrCull))
					.then(Commands.literal("cc_anger").executes(EventMobs::ccAnger))
					.then(Commands.literal("cc_glow").executes(EventMobs::ccGlow))
					.then(Commands.literal("cc_cull").executes(EventMobs::ccCull))
					.then(Commands.literal("no_alive").executes(EventMobs::noAlive))
					.then(Commands.literal("nr_alive").executes(EventMobs::nrAlive))
					.then(Commands.literal("cc_alive").executes(EventMobs::ccAlive)))
		));
	}

	private static boolean canRun(CommandSourceStack source) {
		return source.permissions().hasPermission(Permissions.COMMANDS_GAMEMASTER);
	}

}
