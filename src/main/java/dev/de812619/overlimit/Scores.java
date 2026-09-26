package dev.de812619.overlimit;

import net.minecraft.server.MinecraftServer;
import net.minecraft.server.level.ServerPlayer;
import net.minecraft.world.scores.Objective;
import net.minecraft.world.scores.ReadOnlyScoreInfo;
import net.minecraft.world.scores.ScoreHolder;
import net.minecraft.world.scores.Scoreboard;

final class Scores {
	static final String OBJECTIVE = "overlimit.const";

	private Scores() {
	}

	static int get(MinecraftServer server, String holder) {
		Scoreboard board = server.getScoreboard();
		Objective objective = board.getObjective(OBJECTIVE);
		if (objective == null) {
			return 0;
		}
		ReadOnlyScoreInfo info = board.getPlayerScoreInfo(ScoreHolder.forNameOnly(holder), objective);
		return info == null ? 0 : info.value();
	}

	static void set(MinecraftServer server, String holder, int value) {
		Scoreboard board = server.getScoreboard();
		Objective objective = board.getObjective(OBJECTIVE);
		if (objective == null) {
			return;
		}
		board.getOrCreatePlayerScore(ScoreHolder.forNameOnly(holder), objective).set(value);
	}

	static int getPlayer(ServerPlayer player, String objectiveName) {
		MinecraftServer server = player.level().getServer();
		if (server == null) return 0;
		Scoreboard board = server.getScoreboard();
		Objective objective = board.getObjective(objectiveName);
		if (objective == null) return 0;
		ReadOnlyScoreInfo info = board.getPlayerScoreInfo(player, objective);
		return info == null ? 0 : info.value();
	}

	static void setPlayer(ServerPlayer player, String objectiveName, int value) {
		setHolder(player.level().getServer(), player, objectiveName, value);
	}

	static void addPlayer(ServerPlayer player, String objectiveName, int delta) {
		setPlayer(player, objectiveName, getPlayer(player, objectiveName) + delta);
	}

	static int getHolder(MinecraftServer server, ScoreHolder holder, String objectiveName) {
		if (server == null) return 0;
		Scoreboard board = server.getScoreboard();
		Objective objective = board.getObjective(objectiveName);
		if (objective == null) return 0;
		ReadOnlyScoreInfo info = board.getPlayerScoreInfo(holder, objective);
		return info == null ? 0 : info.value();
	}

	static void setHolder(MinecraftServer server, ScoreHolder holder, String objectiveName, int value) {
		if (server == null) return;
		Scoreboard board = server.getScoreboard();
		Objective objective = board.getObjective(objectiveName);
		if (objective == null) return;
		board.getOrCreatePlayerScore(holder, objective).set(value);
	}

	static void resetHolder(MinecraftServer server, ScoreHolder holder, String objectiveName) {
		if (server == null) return;
		Scoreboard board = server.getScoreboard();
		Objective objective = board.getObjective(objectiveName);
		if (objective == null) return;
		board.resetSinglePlayerScore(holder, objective);
	}
}
