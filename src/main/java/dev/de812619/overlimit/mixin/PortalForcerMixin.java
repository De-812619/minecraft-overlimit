package dev.de812619.overlimit.mixin;

import dev.de812619.overlimit.BloodGates;
import net.minecraft.core.BlockPos;
import net.minecraft.server.level.ServerLevel;
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

	@Inject(method = "lambda$findClosestPortalPosition$1", at = @At("RETURN"), cancellable = true)
	private void overlimit$skipBloodGate(BlockPos pos, CallbackInfoReturnable<Boolean> cir) {
		if (cir.getReturnValueZ() && BloodGates.is(this.level, pos)) {
			cir.setReturnValue(false);
		}
	}
}
