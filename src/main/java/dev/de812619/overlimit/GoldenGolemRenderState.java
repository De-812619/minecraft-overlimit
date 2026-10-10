package dev.de812619.overlimit;

/**
 * 描画ステートに載せる印。Mixin パッケージ内に置くと起動時に読み込めない。
 */
public interface GoldenGolemRenderState {
	void overlimit$setGolden(boolean golden);

	boolean overlimit$isGolden();
}
