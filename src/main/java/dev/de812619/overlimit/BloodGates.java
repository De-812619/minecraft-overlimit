package dev.de812619.overlimit;

import net.minecraft.core.BlockPos;
import net.minecraft.core.Direction;
import net.minecraft.server.level.ServerLevel;
import net.minecraft.server.level.ServerPlayer;
import net.minecraft.world.entity.Entity;
import net.minecraft.world.level.BlockGetter;
import net.minecraft.world.level.block.Block;
import net.minecraft.world.level.block.Blocks;
import net.minecraft.world.level.block.NetherPortalBlock;
import net.minecraft.world.level.block.state.BlockState;

/**
 * 泣く黒曜石の 2×3。中は本物のネザーポータル。黒曜石の門はここを通さない。
 */
public final class BloodGates {
	private static final int[] X_FRAME = {
		-1, -1, 0, 0, -1, 0, 1, -1, 0, 2, -1, 0,
		-1, 3, 0, 0, 3, 0, 1, 3, 0, 2, 3, 0,
		-1, 0, 0, -1, 1, 0, -1, 2, 0,
		2, 0, 0, 2, 1, 0, 2, 2, 0
	};
	private static final int[] Z_FRAME = {
		0, -1, -1, 0, -1, 0, 0, -1, 1, 0, -1, 2,
		0, 3, -1, 0, 3, 0, 0, 3, 1, 0, 3, 2,
		0, 0, -1, 0, 1, -1, 0, 2, -1,
		0, 0, 2, 0, 1, 2, 0, 2, 2
	};
	private static final int[] X_INSIDE = {
		0, 0, 0, 1, 0, 0,
		0, 1, 0, 1, 1, 0,
		0, 2, 0, 1, 2, 0
	};
	private static final int[] Z_INSIDE = {
		0, 0, 0, 0, 0, 1,
		0, 1, 0, 0, 1, 1,
		0, 2, 0, 0, 2, 1
	};

	private BloodGates() {
	}

	public static boolean is(BlockGetter level, BlockPos pos) {
		BlockState state = level.getBlockState(pos);
		if (!state.is(Blocks.NETHER_PORTAL)) {
			return false;
		}
		Direction.Axis axis = state.getValue(NetherPortalBlock.AXIS);
		BlockPos corner = corner(level, pos, axis);
		return cryingFrame(level, corner, axis) && interiorIsPortal(level, corner, axis);
	}

	public static boolean cryingFrame(BlockGetter level, BlockPos origin, Direction.Axis axis) {
		return allCrying(level, origin, axis == Direction.Axis.X ? X_FRAME : Z_FRAME);
	}

	public static boolean interiorIsPortal(BlockGetter level, BlockPos origin, Direction.Axis axis) {
		int[] inside = axis == Direction.Axis.X ? X_INSIDE : Z_INSIDE;
		for (int i = 0; i < inside.length; i += 3) {
			BlockState state = level.getBlockState(origin.offset(inside[i], inside[i + 1], inside[i + 2]));
			if (!state.is(Blocks.NETHER_PORTAL) || state.getValue(NetherPortalBlock.AXIS) != axis) {
				return false;
			}
		}
		return true;
	}

	public static void placeInterior(ServerLevel level, BlockPos origin, Direction.Axis axis) {
		BlockState portal = Blocks.NETHER_PORTAL.defaultBlockState().setValue(NetherPortalBlock.AXIS, axis);
		int[] inside = axis == Direction.Axis.X ? X_INSIDE : Z_INSIDE;
		for (int i = 0; i < inside.length; i += 3) {
			BlockPos at = origin.offset(inside[i], inside[i + 1], inside[i + 2]);
			if (!level.getBlockState(at).is(Blocks.NETHER_PORTAL)) {
				level.setBlock(at, portal, Block.UPDATE_ALL);
			}
		}
	}

	/** プレイヤーだけ既存の転送へ渡す。モブやアイテムはネザーへ送らない。 */
	public static void travel(ServerLevel level, Entity entity) {
		if (entity instanceof ServerPlayer) {
			HotTick.run(level.getServer(), entity, "portal/try_warp");
		}
	}

	private static BlockPos corner(BlockGetter level, BlockPos pos, Direction.Axis axis) {
		Direction horizontal = axis == Direction.Axis.X ? Direction.WEST : Direction.NORTH;
		BlockPos cursor = pos;
		for (int i = 0; i < 21 && level.getBlockState(cursor.relative(horizontal)).is(Blocks.NETHER_PORTAL); i++) {
			cursor = cursor.relative(horizontal);
		}
		for (int i = 0; i < 21 && level.getBlockState(cursor.below()).is(Blocks.NETHER_PORTAL); i++) {
			cursor = cursor.below();
		}
		return cursor;
	}

	private static boolean allCrying(BlockGetter level, BlockPos origin, int[] offsets) {
		for (int i = 0; i < offsets.length; i += 3) {
			if (!level.getBlockState(origin.offset(offsets[i], offsets[i + 1], offsets[i + 2])).is(Blocks.CRYING_OBSIDIAN)) {
				return false;
			}
		}
		return true;
	}
}
