package dev.de812619.overlimit;

import net.fabricmc.fabric.api.event.player.PlayerBlockBreakEvents;
import net.minecraft.core.BlockPos;
import net.minecraft.core.particles.BlockParticleOption;
import net.minecraft.core.particles.ParticleTypes;
import net.minecraft.core.registries.Registries;
import net.minecraft.network.protocol.game.ClientboundBlockUpdatePacket;
import net.minecraft.resources.Identifier;
import net.minecraft.server.level.ServerLevel;
import net.minecraft.server.level.ServerPlayer;
import net.minecraft.tags.BlockTags;
import net.minecraft.tags.TagKey;
import net.minecraft.world.entity.EquipmentSlot;
import net.minecraft.world.level.block.Block;
import net.minecraft.world.level.block.entity.BlockEntity;
import net.minecraft.world.level.block.state.BlockState;

import java.util.ArrayList;
import java.util.List;

/**
 * ハイパーディグ：掘ったマスを中心に 3×3×3。
 * 周囲は通常採掘と同じ破壊演出（粒子と音）を出してから、手持ちの幸運・シルクタッチで落とす。
 * 耐久はプレイヤーが掘った 1 マス分だけ減る。
 */
final class HyperDig {
	private static final Identifier ENCHANT_ID =
		Identifier.fromNamespaceAndPath("overlimit", "hyper_dig");
	private static final TagKey<Block> IMMUNE = TagKey.create(
		Registries.BLOCK,
		Identifier.fromNamespaceAndPath("overlimit", "hyper_dig_immune")
	);
	/** バニラのブロック破壊演出。送信元プレイヤーを渡すとその人には届かない。 */
	private static final int BREAK_PARTICLES = 2001;
	private static final int BURST_COUNT = 28;

	private static boolean breaking;

	private HyperDig() {
	}

	static void register() {
		PlayerBlockBreakEvents.AFTER.register((world, player, pos, state, blockEntity) -> {
			if (breaking) return;
			if (!(world instanceof ServerLevel level)) return;
			if (!(player instanceof ServerPlayer serverPlayer)) return;
			if (!SkyWalk.hasEnchant(serverPlayer.getItemBySlot(EquipmentSlot.MAINHAND), ENCHANT_ID)) return;

			breaking = true;
			try {
				breakCube(level, serverPlayer, pos);
			} finally {
				breaking = false;
			}
		});
	}

	private static void breakCube(ServerLevel level, ServerPlayer player, BlockPos origin) {
		List<PendingDrop> drops = new ArrayList<>(26);
		BlockPos.MutableBlockPos cursor = new BlockPos.MutableBlockPos();
		for (int x = -1; x <= 1; x++) {
			for (int y = -1; y <= 1; y++) {
				for (int z = -1; z <= 1; z++) {
					if (x == 0 && y == 0 && z == 0) {
						continue;
					}
					cursor.set(origin.getX() + x, origin.getY() + y, origin.getZ() + z);
					PendingDrop drop = removeOne(level, player, cursor);
					if (drop != null) {
						drops.add(drop);
					}
				}
			}
		}
		for (PendingDrop drop : drops) {
			Block.dropResources(drop.state, level, drop.pos, drop.blockEntity, player, player.getMainHandItem());
		}
	}

	/** 見た目を先に消す。ドロップ生成は全マスの除去が終わってから行う。 */
	private static PendingDrop removeOne(ServerLevel level, ServerPlayer player, BlockPos pos) {
		BlockState state = level.getBlockState(pos);
		if (state.isAir() || state.is(BlockTags.REPLACEABLE) || state.is(IMMUNE)) {
			return null;
		}
		BlockEntity blockEntity = state.hasBlockEntity() ? level.getBlockEntity(pos) : null;
		BlockPos at = pos.immutable();
		level.levelEvent(null, BREAK_PARTICLES, at, Block.getId(state));
		level.sendParticles(
			new BlockParticleOption(ParticleTypes.BLOCK, state),
			true,
			false,
			at.getX() + 0.5,
			at.getY() + 0.5,
			at.getZ() + 0.5,
			BURST_COUNT,
			0.45,
			0.45,
			0.45,
			0.22
		);
		if (!level.removeBlock(at, false)) {
			return null;
		}
		player.connection.send(new ClientboundBlockUpdatePacket(at, level.getBlockState(at)));
		return new PendingDrop(at, state, blockEntity);
	}

	private record PendingDrop(BlockPos pos, BlockState state, BlockEntity blockEntity) {
	}
}
