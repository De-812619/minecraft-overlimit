package dev.de812619.overlimit.mixin;

import dev.de812619.overlimit.GoldenGolem;
import net.minecraft.sounds.SoundEvents;
import net.minecraft.world.InteractionHand;
import net.minecraft.world.InteractionResult;
import net.minecraft.world.entity.animal.golem.IronGolem;
import net.minecraft.world.entity.player.Player;
import net.minecraft.world.item.ItemStack;
import net.minecraft.world.item.Items;
import net.minecraft.world.level.storage.ValueInput;
import org.spongepowered.asm.mixin.Mixin;
import org.spongepowered.asm.mixin.injection.At;
import org.spongepowered.asm.mixin.injection.Inject;
import org.spongepowered.asm.mixin.injection.callback.CallbackInfo;
import org.spongepowered.asm.mixin.injection.callback.CallbackInfoReturnable;

@Mixin(IronGolem.class)
abstract class IronGolemMixin {
	@Inject(method = "readAdditionalSaveData", at = @At("RETURN"))
	private void overlimit$markGolden(ValueInput input, CallbackInfo ci) {
		GoldenGolem.mark((IronGolem) (Object) this);
	}

	@Inject(method = "mobInteract", at = @At("HEAD"), cancellable = true)
	private void overlimit$repairWithGold(Player player, InteractionHand hand, CallbackInfoReturnable<InteractionResult> cir) {
		IronGolem self = (IronGolem) (Object) this;
		if (!self.entityTags().contains(GoldenGolem.TAG)) {
			return;
		}
		ItemStack stack = player.getItemInHand(hand);
		if (!stack.is(Items.GOLD_INGOT)) {
			cir.setReturnValue(InteractionResult.PASS);
			return;
		}
		float before = self.getHealth();
		self.heal(25.0F);
		if (self.getHealth() == before) {
			cir.setReturnValue(InteractionResult.PASS);
			return;
		}
		float pitch = 1.0F + (self.getRandom().nextFloat() - self.getRandom().nextFloat()) * 0.2F;
		self.playSound(SoundEvents.IRON_GOLEM_REPAIR, 1.0F, pitch);
		stack.consume(1, player);
		cir.setReturnValue(InteractionResult.SUCCESS);
	}
}
