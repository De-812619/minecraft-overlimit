# テスト用。同じ座標のままブラッドワールドへ送る（ポータル不要。入場制限も見ない）。
execute in overlimit:blood_world run tp @s ~ ~ ~
tellraw @s {"text":"[overlimit] ブラッドワールドへ送った（同じ座標）。戻る: /execute in minecraft:overworld run tp @s ~ ~ ~","color":"gold"}
