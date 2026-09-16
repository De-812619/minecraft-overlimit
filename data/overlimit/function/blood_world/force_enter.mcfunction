# テスト用。同じ座標のままブラッドワールドへ送る（ポータル不要。入場制限も見ない）。
execute in overlimit:blood_world run tp @s ~ ~ ~
tellraw @s {"translate": "overlimit.cmd.bw_enter","color":"gold"}
