package dev.de812619.overlimit;

import net.fabricmc.fabric.api.entity.event.v1.ServerLivingEntityEvents;
import net.minecraft.core.registries.Registries;
import net.minecraft.resources.Identifier;
import net.minecraft.server.level.ServerLevel;
import net.minecraft.server.level.ServerPlayer;
import net.minecraft.tags.TagKey;
import net.minecraft.world.damagesource.DamageSource;
import net.minecraft.world.effect.MobEffects;
import net.minecraft.world.entity.Entity;
import net.minecraft.world.entity.EntityType;
import net.minecraft.world.entity.LivingEntity;
import net.minecraft.world.entity.ai.attributes.Attributes;

/**
 * クォーツセット: バニラ相当クリ時に攻撃力の 15% を追加ダメージ。
 */
final class TrimQuartz {
	private static final String SET_TAG = "overlimit.trim.set.quartz";
	private static final String SUMMON_TAG = "overlimit.summon";
	private static final TagKey<EntityType<?>> HOSTILE = TagKey.create(
		Registries.ENTITY_TYPE,
		Identifier.fromNamespaceAndPath("overlimit", "hostile")
	);
	private static final float EXTRA_RATIO = 0.15f;

	/** 追加ダメージ中の再入防止。 */
	private static boolean applyingExtra;

	private TrimQuartz() {
	}

	static void register() {
		ServerLivingEntityEvents.AFTER_DAMAGE.register(TrimQuartz::onDamage);
	}

	private static void onDamage(LivingEntity victim, DamageSource source,
		float baseDamageTaken, float damageTaken, boolean blocked) {
		if (applyingExtra || blocked) return;
		if (!(source.getEntity() instanceof ServerPlayer player)) return;
		if (!(victim.level() instanceof ServerLevel level)) return;
		if (!source.isDirect()) return;
		if (!player.entityTags().contains(SET_TAG)) return;
		if (!isVanillaCrit(player)) return;
		if (victim.entityTags().contains(SUMMON_TAG)) return;
		if (!victim.getType().builtInRegistryHolder().is(HOSTILE)) return;

		float extra = (float) (player.getAttributeValue(Attributes.ATTACK_DAMAGE) * EXTRA_RATIO);
		if (extra <= 0.0f) return;

		applyingExtra = true;
		try {
			victim.hurtServer(level, level.damageSources().playerAttack(player), extra);
		} finally {
			applyingExtra = false;
		}
	}

	/** バニラ {@code Player.attack} のクリティカル条件に近い判定。 */
	static boolean isVanillaCrit(ServerPlayer player) {
		return player.fallDistance > 0.0
			&& !player.onGround()
			&& !player.onClimbable()
			&& !player.isInWater()
			&& !player.hasEffect(MobEffects.BLINDNESS)
			&& !player.isPassenger()
			&& !player.isSprinting();
	}
}
