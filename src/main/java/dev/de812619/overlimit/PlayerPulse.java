package dev.de812619.overlimit;

import net.fabricmc.fabric.api.event.lifecycle.v1.ServerTickEvents;
import net.minecraft.core.particles.ParticleTypes;
import net.minecraft.network.protocol.game.ClientboundSoundPacket;
import net.minecraft.server.MinecraftServer;
import net.minecraft.server.level.ServerLevel;
import net.minecraft.server.level.ServerPlayer;
import net.minecraft.sounds.SoundEvents;
import net.minecraft.sounds.SoundSource;
import net.minecraft.util.Mth;
import net.minecraft.world.effect.MobEffects;
import net.minecraft.world.phys.Vec3;

/**
 * プレイヤーごとのクールダウン減算。
 * 強化の抽選は {@link MobRank}。スコア名はデータパックのまま。表示パーティクルは本人にだけ送る。
 */
final class PlayerPulse {
	private PlayerPulse() {
	}

	static void register() {
		ServerTickEvents.START_SERVER_TICK.register(PlayerPulse::onTick);
	}

	private static void onTick(MinecraftServer server) {
		for (ServerPlayer player : server.getPlayerList().getPlayers()) {
			tickCooldowns(server, player);
		}
	}

	private static void tickCooldowns(MinecraftServer server, ServerPlayer player) {
		decrement(player, "overlimit.cd.absolute");
		decrement(player, "overlimit.cd.ul_royal");
		decrement(player, "overlimit.cd.ul_demon");
		tickReadyFx(player, "overlimit.cd.impact", ParticleTypes.SMOKE, 0.008, 0.004);
		tickReadyFx(player, "overlimit.cd.hyper", ParticleTypes.PORTAL, 0.2, 0.15);
		int pending = Scores.getPlayer(player, "overlimit.necro_pending");
		if (pending >= 1) {
			Scores.setPlayer(player, "overlimit.necro_pending", pending - 1);
		}
		decrement(player, "overlimit.necro_cd");
		if (Scores.getPlayer(player, "overlimit.necro_pending") >= 1) {
			HotTick.run(server, player, "enchant/necromancy/check_kill_score");
			if (Scores.getPlayer(player, "overlimit.necro_pending") >= 1) {
				Scores.setPlayer(player, "overlimit.mob_prev", Scores.getPlayer(player, "overlimit.mob_kills"));
			}
		}
		decrement(player, "overlimit.astral.draincd");
		int hunger = Scores.getPlayer(player, "overlimit.astral.hunger_t");
		if (hunger == 1) {
			player.removeEffect(MobEffects.HUNGER);
		}
		if (hunger >= 1) {
			Scores.setPlayer(player, "overlimit.astral.hunger_t", hunger - 1);
		}
		decrement(player, "overlimit.ul.sw_cd");
		decrement(player, "overlimit.ul.ax_cd");
		decrement(player, "overlimit.ul.sp_cd");
		if (Scores.getPlayer(player, "overlimit.ul.used") >= 1) {
			HotTick.run(server, player, "item/unlimited/sword_used");
		}
		if (Scores.getPlayer(player, "overlimit.ul.axe_used") >= 1) {
			HotTick.run(server, player, "item/unlimited/axe_used");
		}
		if (Scores.getPlayer(player, "overlimit.anvil_cap") >= 1) {
			HotTick.run(server, player, "enchant/anvil_cap/apply");
			decrement(player, "overlimit.anvil_cap");
		}
	}

	private static void decrement(ServerPlayer player, String objective) {
		int value = Scores.getPlayer(player, objective);
		if (value >= 1) {
			Scores.setPlayer(player, objective, value - 1);
		}
	}

	private static void tickReadyFx(ServerPlayer player, String objective,
		net.minecraft.core.particles.ParticleOptions particle, double footSpeed, double handSpeed) {
		int value = Scores.getPlayer(player, objective);
		if (value < 1) {
			return;
		}
		if ((value & 1) == 0 && player.level() instanceof ServerLevel level) {
			level.sendParticles(player, particle, false, false,
				player.getX(), player.getY() + 0.25, player.getZ(), 1, 0.1, 0.04, 0.1, footSpeed);
			Vec3 hand = handPos(player);
			level.sendParticles(player, particle, false, false,
				hand.x, hand.y, hand.z, 1, 0.03, 0.03, 0.03, handSpeed);
		}
		if (value == 1) {
			player.connection.send(new ClientboundSoundPacket(
				SoundEvents.CROSSBOW_LOADING_END,
				SoundSource.PLAYERS,
				player.getX(), player.getY(), player.getZ(),
				0.8F, 1.0F,
				player.getRandom().nextLong()
			));
		}
		Scores.setPlayer(player, objective, value - 1);
	}

	private static Vec3 handPos(ServerPlayer player) {
		float yaw = player.getYRot() * Mth.DEG_TO_RAD;
		Vec3 look = player.getViewVector(1.0F);
		Vec3 left = new Vec3(Mth.cos(yaw), 0.0, Mth.sin(yaw));
		Vec3 up = left.cross(look);
		if (up.lengthSqr() < 1.0E-6) {
			up = new Vec3(0.0, 1.0, 0.0);
		} else {
			up = up.normalize();
		}
		return player.getEyePosition().add(left.scale(-0.35)).add(up.scale(-0.3)).add(look.scale(0.5));
	}
}
