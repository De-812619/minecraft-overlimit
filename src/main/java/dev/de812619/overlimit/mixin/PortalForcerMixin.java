package dev.de812619.overlimit.mixin;

import dev.de812619.overlimit.BloodGates;
import java.util.Comparator;
import java.util.Optional;
import net.minecraft.core.BlockPos;
import net.minecraft.core.Vec3i;
import net.minecraft.server.level.ServerLevel;
import net.minecraft.world.entity.ai.village.poi.PoiManager;
import net.minecraft.world.entity.ai.village.poi.PoiRecord;
import net.minecraft.world.entity.ai.village.poi.PoiTypes;
import net.minecraft.world.level.block.state.properties.BlockStateProperties;
import net.minecraft.world.level.border.WorldBorder;
import net.minecraft.world.level.portal.PortalForcer;
import org.spongepowered.asm.mixin.Final;
import org.spongepowered.asm.mixin.Mixin;
import org.spongepowered.asm.mixin.Shadow;
import org.spongepowered.asm.mixin.injection.At;
import org.spongepowered.asm.mixin.injection.Inject;
import org.spongepowered.asm.mixin.injection.callback.CallbackInfoReturnable;

@Mixin(PortalForcer.class)
abstract class PortalForcerMixin {
	@Shadow
	@Final
	private ServerLevel level;

	@Inject(method = "findClosestPortalPosition", at = @At("RETURN"), cancellable = true)
	private void overlimit$skipBloodGate(
		BlockPos exitPos,
		boolean isNether,
		WorldBorder worldBorder,
		CallbackInfoReturnable<Optional<BlockPos>> cir
	) {
		Optional<BlockPos> found = cir.getReturnValue();
		if (found.isEmpty() || !BloodGates.blocksNetherTravel(this.level, found.get())) {
			return;
		}
		int radius = isNether ? 16 : 128;
		Optional<BlockPos> next = this.level.getPoiManager()
			.getInSquare(holder -> holder.is(PoiTypes.NETHER_PORTAL), exitPos, radius, PoiManager.Occupancy.ANY)
			.map(PoiRecord::getPos)
			.filter(worldBorder::isWithinBounds)
			.filter(pos -> this.level.getBlockState(pos).hasProperty(BlockStateProperties.HORIZONTAL_AXIS))
			.filter(pos -> !BloodGates.blocksNetherTravel(this.level, pos))
			.min(Comparator.<BlockPos>comparingDouble(pos -> pos.distSqr(exitPos)).thenComparingInt(Vec3i::getY));
		cir.setReturnValue(next);
	}
}
