package dev.de812619.overlimit.mixin;

import dev.de812619.overlimit.GoldenGolem;
import dev.de812619.overlimit.GoldenGolemRenderState;
import net.minecraft.client.renderer.entity.IronGolemRenderer;
import net.minecraft.client.renderer.entity.state.IronGolemRenderState;
import net.minecraft.resources.Identifier;
import net.minecraft.world.entity.animal.golem.IronGolem;
import org.spongepowered.asm.mixin.Mixin;
import org.spongepowered.asm.mixin.injection.At;
import org.spongepowered.asm.mixin.injection.Inject;
import org.spongepowered.asm.mixin.injection.callback.CallbackInfo;
import org.spongepowered.asm.mixin.injection.callback.CallbackInfoReturnable;

@Mixin(IronGolemRenderer.class)
abstract class IronGolemRendererMixin {
	private static final Identifier GOLDEN = Identifier.fromNamespaceAndPath("overlimit", "textures/entity/golden_golem.png");

	@Inject(method = "extractRenderState", at = @At("TAIL"))
	private void overlimit$copyGolden(IronGolem golem, IronGolemRenderState state, float partialTick, CallbackInfo ci) {
		((GoldenGolemRenderState) (Object) state).overlimit$setGolden(GoldenGolem.isMarked(golem));
	}

	@Inject(method = "getTextureLocation", at = @At("HEAD"), cancellable = true)
	private void overlimit$goldenTexture(IronGolemRenderState state, CallbackInfoReturnable<Identifier> cir) {
		if (((GoldenGolemRenderState) (Object) state).overlimit$isGolden()) {
			cir.setReturnValue(GOLDEN);
		}
	}
}
