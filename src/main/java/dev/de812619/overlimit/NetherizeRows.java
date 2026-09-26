package dev.de812619.overlimit;

import net.minecraft.commands.CommandSourceStack;
import net.minecraft.commands.functions.CommandFunction;
import net.minecraft.core.BlockPos;
import net.minecraft.nbt.CompoundTag;
import net.minecraft.resources.Identifier;
import net.minecraft.server.MinecraftServer;
import net.minecraft.server.level.ServerLevel;
import net.minecraft.world.phys.Vec3;

/**
 * {@code netherize_row} を 1 tick に 4 行。列関数はコマンド実行中に積むと、
 * スコアを進めたあとに同じ座標へまとめて走る。tick 末で、1列ずつ実行し終えてから次へ進む。
 */
final class NetherizeRows {
	private static final int ROWS_PER_TICK = 4;
	private static final Identifier STORAGE = Identifier.fromNamespaceAndPath("overlimit", "no");

	private NetherizeRows() {
	}

	static void onEndTick(MinecraftServer server) {
		if (Scores.get(server, "#no_nethering") != 1) {
			return;
		}
		if (server.getScoreboard().getObjective(Scores.OBJECTIVE) == null) {
			return;
		}
		CompoundTag neth = server.getCommandStorage().get(STORAGE).getCompoundOrEmpty("neth");
		if (!neth.contains("x")) {
			OverlimitMod.LOGGER.warn("Netherize missing storage overlimit:no neth");
			return;
		}
		int gateX = neth.getIntOr("x", 0);
		int gateY = neth.getIntOr("y", 0);
		int gateZ = neth.getIntOr("z", 0);
		ServerLevel level = server.overworld();
		CommandSourceStack source = server.getFunctions().getGameLoopSender()
			.withLevel(level)
			.withPosition(new Vec3(gateX, gateY, gateZ));
		BlockPos gate = new BlockPos(gateX, gateY, gateZ);
		int rad = Scores.get(server, "#no_rad");
		for (int row = 0; row < ROWS_PER_TICK; row++) {
			if (Scores.get(server, "#no_nethering") != 1) {
				break;
			}
			if (Scores.get(server, "#no_nz") > rad) {
				runFunction(server, source, "nether_overflow/netherize_finish");
				return;
			}
			Scores.set(server, "#no_nx", Scores.get(server, "#no_nrad"));
			walkX(server, level, source, gate);
			Scores.set(server, "#no_nz", Scores.get(server, "#no_nz") + 1);
		}
	}

	private static void walkX(MinecraftServer server, ServerLevel level, CommandSourceStack source, BlockPos gate) {
		for (int step = 0; step < 4096; step++) {
			int nx = Scores.get(server, "#no_nx");
			int nz = Scores.get(server, "#no_nz");
			int rad = Scores.get(server, "#no_rad");
			int xx = nx * nx;
			int zz = nz * nz;
			Scores.set(server, "#no_xx", xx);
			Scores.set(server, "#no_zz", zz);
			Scores.set(server, "#no_sum", xx + zz);
			Scores.set(server, "#no_rr", rad * rad);
			if (xx + zz <= rad * rad) {
				runFunction(server, source, "nether_overflow/netherize_column");
			}
			nx = Scores.get(server, "#no_nx") + 1;
			rad = Scores.get(server, "#no_rad");
			Scores.set(server, "#no_nx", nx);
			if (nx > rad) {
				return;
			}
		}
		OverlimitMod.LOGGER.warn("Netherize row stopped after 4096 columns");
	}

	private static void runFunction(MinecraftServer server, CommandSourceStack source, String path) {
		Identifier id = Identifier.fromNamespaceAndPath("overlimit", path);
		CommandFunction<CommandSourceStack> function = server.getFunctions().get(id).orElse(null);
		if (function == null) {
			OverlimitMod.LOGGER.warn("Missing function overlimit:{}", path);
			return;
		}
		try {
			server.getFunctions().execute(function, source);
		} catch (RuntimeException ex) {
			OverlimitMod.LOGGER.warn("Function overlimit:{} failed", path, ex);
		}
	}
}
