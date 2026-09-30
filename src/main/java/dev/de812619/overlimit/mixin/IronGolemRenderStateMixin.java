package dev.de812619.overlimit.mixin;

import dev.de812619.overlimit.GoldenGolemRenderState;
import net.minecraft.client.renderer.entity.state.IronGolemRenderState;
import org.spongepowered.asm.mixin.Mixin;
import org.spongepowered.asm.mixin.Unique;

@Mixin(IronGolemRenderState.class)
public class IronGolemRenderStateMixin implements GoldenGolemRenderState {
	@Unique
	private boolean overlimit$golden;

	@Override
	public void overlimit$setGolden(boolean golden) {
		this.overlimit$golden = golden;
	}

	@Override
	public boolean overlimit$isGolden() {
		return this.overlimit$golden;
	}
}
