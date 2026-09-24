package dev.de812619.overlimit;

import net.fabricmc.fabric.api.event.player.PlayerBlockBreakEvents;
import net.minecraft.commands.CommandSourceStack;
import net.minecraft.commands.functions.CommandFunction;
import net.minecraft.core.BlockPos;
import net.minecraft.resources.Identifier;
import net.minecraft.server.MinecraftServer;
import net.minecraft.server.level.ServerLevel;
import net.minecraft.server.level.ServerPlayer;
import net.minecraft.world.entity.EquipmentSlot;
import net.minecraft.world.phys.Vec3;

/**
 * ハイパーディグ：ブロック破壊時に {@code break_cube} を実行して 3×3×3 を掘る。
 * データパックの tick ポーリング（hd_ok/hd_pok）を廃止し
 * {@link PlayerBlockBreakEvents#AFTER} で即時発火する。
 */
final class HyperDig {
	private static final Identifier ENCHANT_ID =
		Identifier.fromNamespaceAndPath("overlimit", "hyper_dig");
	private static final Identifier BREAK_CUBE =
		Identifier.fromNamespaceAndPath("overlimit", "enchant/hyper_dig/break_cube");

	private HyperDig() {
	}

	static void register() {
		PlayerBlockBreakEvents.AFTER.register((world, player, pos, state, blockEntity) -> {
			if (!(world instanceof ServerLevel level)) return;
			if (!(player instanceof ServerPlayer serverPlayer)) return;

			// メインハンドにハイパーディグがあるか確認
			if (!SkyWalk.hasEnchant(serverPlayer.getItemBySlot(EquipmentSlot.MAINHAND), ENCHANT_ID)) return;

			runAtPos(level, serverPlayer, pos);
		});
	}

	/** 破壊したブロック座標を中心に break_cube を実行する。 */
	private static void runAtPos(ServerLevel level, ServerPlayer serverPlayer, BlockPos pos) {
		MinecraftServer server = level.getServer();
		CommandFunction<CommandSourceStack> fn = server.getFunctions().get(BREAK_CUBE).orElse(null);
		if (fn == null) {
			if (OverlimitMod.LOGGER.isWarnEnabled()) {
				OverlimitMod.LOGGER.warn("Missing function {}", BREAK_CUBE);
			}
			return;
		}
		CommandSourceStack source = server.getFunctions().getGameLoopSender()
			.withLevel(level)
			.withEntity(serverPlayer)
			.withPosition(Vec3.atCenterOf(pos))
			.withRotation(serverPlayer.getRotationVector())
			.withSuppressedOutput();
		server.getFunctions().execute(fn, source);
	}
}
