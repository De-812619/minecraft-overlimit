package dev.de812619.overlimit.mixin;

import net.minecraft.network.syncher.EntityDataAccessor;
import net.minecraft.world.entity.animal.golem.IronGolem;
import org.spongepowered.asm.mixin.Mixin;
import org.spongepowered.asm.mixin.gen.Accessor;

@Mixin(IronGolem.class)
public interface IronGolemFlagsAccessor {
	@Accessor("DATA_FLAGS_ID")
	static EntityDataAccessor<Byte> overlimit$flags() {
		throw new AssertionError();
	}
}
