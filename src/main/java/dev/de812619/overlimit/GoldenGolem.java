package dev.de812619.overlimit;

import net.minecraft.network.syncher.EntityDataAccessor;
import net.minecraft.network.syncher.SynchedEntityData;
import net.minecraft.world.entity.animal.golem.IronGolem;
import dev.de812619.overlimit.mixin.IronGolemFlagsAccessor;

/**
 * ゴールデンゴーレムはバニラのアイアンゴーレムのまま。
 * 描画用の印は、プレイヤー作成フラグと同じ同期バイトの bit 1。
 * エンティティタグはクライアントへ届かない。
 */
public final class GoldenGolem {
	public static final String TAG = "overlimit.golden_golem";
	static final byte FLAG = 0x2;

	private GoldenGolem() {
	}

	public static void mark(IronGolem golem) {
		if (!golem.entityTags().contains(TAG)) {
			return;
		}
		SynchedEntityData data = golem.getEntityData();
		EntityDataAccessor<Byte> key = IronGolemFlagsAccessor.overlimit$flags();
		byte flags = data.get(key);
		if ((flags & FLAG) == 0) {
			data.set(key, (byte) (flags | FLAG));
		}
	}

	public static boolean isMarked(IronGolem golem) {
		return (golem.getEntityData().get(IronGolemFlagsAccessor.overlimit$flags()) & FLAG) != 0;
	}
}
