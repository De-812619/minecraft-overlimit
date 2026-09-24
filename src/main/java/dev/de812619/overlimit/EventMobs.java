package dev.de812619.overlimit;

import com.mojang.brigadier.context.CommandContext;
import net.minecraft.commands.CommandSourceStack;
import net.minecraft.server.MinecraftServer;
import net.minecraft.server.level.ServerLevel;
import net.minecraft.world.effect.MobEffects;
import net.minecraft.world.entity.Entity;
import net.minecraft.world.entity.LivingEntity;
import net.minecraft.world.phys.Vec3;

import java.util.Set;

/**
 * イベント中の種類なし {@code @e} の代わりに、読み込み済みの監視対象だけを見る。
 * 撃破点は朝判定より前の呼び出し位置のまま。
 */
final class EventMobs {
	private static final String BLOOD = "overlimit.blood_moon";
	private static final String OW = "overlimit.bm_ow";
	private static final String BW = "overlimit.bm_bw";
	private static final double NEAR_SQ = 48.0D * 48.0D;

	private EventMobs() {
	}

	static int owCredit(CommandContext<CommandSourceStack> ctx) {
		return credit(ctx, OW, "blood_moon/credit_if_dead");
	}

	static int bwCredit(CommandContext<CommandSourceStack> ctx) {
		return credit(ctx, BW, "blood_world/credit_if_dead");
	}

	static int owRanks(CommandContext<CommandSourceStack> ctx) {
		return ranks(OW);
	}

	static int bwRanks(CommandContext<CommandSourceStack> ctx) {
		return ranks(BW);
	}

	static int owCull(CommandContext<CommandSourceStack> ctx) {
		return cull(ctx, OW, "blood_moon/cull_one");
	}

	static int bwCull(CommandContext<CommandSourceStack> ctx) {
		return cull(ctx, BW, "blood_world/cull_one");
	}

	static int noAnger(CommandContext<CommandSourceStack> ctx) {
		return runTagged(ctx, "overlimit.no_wave", "overlimit.no_ghast", "nether_overflow/anger");
	}

	static int noGlow(CommandContext<CommandSourceStack> ctx) {
		return runTagged(ctx, "overlimit.no_wave", "overlimit.no_ghast", "nether_overflow/glow");
	}

	static int noUnglow(CommandContext<CommandSourceStack> ctx) {
		return unglow(ctx, "overlimit.no_ghast");
	}

	static int noCull(CommandContext<CommandSourceStack> ctx) {
		return runTagged(ctx, "overlimit.no_wave", null, "nether_overflow/cull_one");
	}

	static int nrAnger(CommandContext<CommandSourceStack> ctx) {
		return runTagged(ctx, "overlimit.nr_wave", "overlimit.nr_ghast", "nether_raise/anger");
	}

	static int nrGlow(CommandContext<CommandSourceStack> ctx) {
		return runTagged(ctx, "overlimit.nr_wave", "overlimit.nr_ghast", "nether_raise/glow");
	}

	static int nrUnglow(CommandContext<CommandSourceStack> ctx) {
		return unglow(ctx, "overlimit.nr_ghast");
	}

	static int nrCull(CommandContext<CommandSourceStack> ctx) {
		return runTagged(ctx, "overlimit.nr_wave", null, "nether_raise/cull_one");
	}

	static int ccAnger(CommandContext<CommandSourceStack> ctx) {
		return runTagged(ctx, "overlimit.cc_wave", null, "city_clamp/anger");
	}

	static int ccGlow(CommandContext<CommandSourceStack> ctx) {
		return runTagged(ctx, "overlimit.cc_wave", null, "city_clamp/glow");
	}

	static int ccCull(CommandContext<CommandSourceStack> ctx) {
		return runTagged(ctx, "overlimit.cc_wave", null, "city_clamp/cull_one");
	}

	/** #no_alive・#no_ghast_alive をウェーブ個体数で書く。spawn_pulse / check_clear から呼ぶ。 */
	static int noAlive(CommandContext<CommandSourceStack> ctx) {
		MinecraftServer server = ctx.getSource().getServer();
		int alive = 0;
		int ghast = 0;
		for (Entity e : HotTick.snapshot()) {
			if (e.isRemoved()) continue;
			Set<String> tags = e.entityTags();
			if (tags.contains("overlimit.no_wave")) {
				alive++;
				if (tags.contains("overlimit.no_ghast")) ghast++;
			}
		}
		Scores.set(server, "#no_alive", alive);
		Scores.set(server, "#no_ghast_alive", ghast);
		return 1;
	}

	/** #nr_alive・#nr_ghast_alive をウェーブ個体数で書く。 */
	static int nrAlive(CommandContext<CommandSourceStack> ctx) {
		MinecraftServer server = ctx.getSource().getServer();
		int alive = 0;
		int ghast = 0;
		for (Entity e : HotTick.snapshot()) {
			if (e.isRemoved()) continue;
			Set<String> tags = e.entityTags();
			if (tags.contains("overlimit.nr_wave")) {
				alive++;
				if (tags.contains("overlimit.nr_ghast")) ghast++;
			}
		}
		Scores.set(server, "#nr_alive", alive);
		Scores.set(server, "#nr_ghast_alive", ghast);
		return 1;
	}

	/** #cc_alive・#cc_ghast_alive をウェーブ個体数で書く。 */
	static int ccAlive(CommandContext<CommandSourceStack> ctx) {
		MinecraftServer server = ctx.getSource().getServer();
		int alive = 0;
		int ghast = 0;
		for (Entity e : HotTick.snapshot()) {
			if (e.isRemoved()) continue;
			Set<String> tags = e.entityTags();
			if (tags.contains("overlimit.cc_wave")) {
				alive++;
				if (tags.contains("overlimit.cc_ghast")) ghast++;
			}
		}
		Scores.set(server, "#cc_alive", alive);
		Scores.set(server, "#cc_ghast_alive", ghast);
		return 1;
	}

	static int count(CommandContext<CommandSourceStack> ctx) {
		CommandSourceStack source = ctx.getSource();
		MinecraftServer server = source.getServer();
		Entity player = source.getEntity();
		if (player == null || !(player.level() instanceof ServerLevel playerLevel)) {
			Scores.set(server, "#bm_alive", 0);
			Scores.set(server, "#bm_near", 0);
			return 1;
		}
		boolean inBloodWorld = player.entityTags().contains("overlimit.in_bw");
		String side = inBloodWorld ? BW : OW;
		Vec3 at = source.getPosition();
		int alive = 0;
		int near = 0;
		for (Entity entity : HotTick.snapshot()) {
			if (entity.isRemoved() || !tagged(entity, BLOOD) || !tagged(entity, side)) {
				continue;
			}
			alive++;
			if (entity.level() == playerLevel && entity.getBoundingBox().distanceToSqr(at) <= NEAR_SQ) {
				near++;
			}
		}
		Scores.set(server, "#bm_alive", alive);
		Scores.set(server, "#bm_near", near);
		return 1;
	}

	private static int credit(CommandContext<CommandSourceStack> ctx, String side, String function) {
		MinecraftServer server = ctx.getSource().getServer();
		for (Entity entity : HotTick.snapshot()) {
			if (entity.isRemoved() || !tagged(entity, BLOOD) || !tagged(entity, side) || tagged(entity, "overlimit.bm_scored")) {
				continue;
			}
			HotTick.run(server, entity, function);
		}
		return 1;
	}

	private static int ranks(String side) {
		for (Entity entity : HotTick.snapshot()) {
			if (entity.isRemoved()) {
				continue;
			}
			Set<String> tags = entity.entityTags();
			if (!tags.contains(BLOOD) || !tags.contains(side)) {
				continue;
			}
			if (tags.contains("overlimit.crisis") && !tags.contains("overlimit.bm_crisis")) {
				entity.addTag("overlimit.bm_crisis");
			}
			if (tags.contains("overlimit.disaster") && !tags.contains("overlimit.bm_disaster")) {
				entity.addTag("overlimit.bm_disaster");
			}
			if (!tags.contains("overlimit.crisis")
				&& !tags.contains("overlimit.disaster")
				&& !tags.contains("overlimit.bm_normal")) {
				entity.addTag("overlimit.bm_normal");
			}
		}
		return 1;
	}

	private static int cull(CommandContext<CommandSourceStack> ctx, String side, String function) {
		MinecraftServer server = ctx.getSource().getServer();
		for (Entity entity : HotTick.snapshot()) {
			if (entity.isRemoved() || !tagged(entity, BLOOD) || !tagged(entity, side)) {
				continue;
			}
			HotTick.run(server, entity, function);
		}
		return 1;
	}

	private static int runTagged(CommandContext<CommandSourceStack> ctx, String tag, String exclude, String function) {
		MinecraftServer server = ctx.getSource().getServer();
		for (Entity entity : HotTick.snapshot()) {
			if (entity.isRemoved() || !tagged(entity, tag) || (exclude != null && tagged(entity, exclude))) {
				continue;
			}
			HotTick.run(server, entity, function);
		}
		return 1;
	}

	private static int unglow(CommandContext<CommandSourceStack> ctx, String tag) {
		for (Entity entity : HotTick.snapshot()) {
			if (entity.isRemoved() || !tagged(entity, tag) || !(entity instanceof LivingEntity living)) {
				continue;
			}
			living.removeEffect(MobEffects.GLOWING);
		}
		return 1;
	}

	private static boolean tagged(Entity entity, String tag) {
		return entity.entityTags().contains(tag);
	}
}
