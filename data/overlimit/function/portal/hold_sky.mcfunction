# 地表へ落とさず、抽選座標の上空でチャンクを載せる。
$execute in overlimit:blood_world positioned $(x) 0 $(z) run forceload add ~-32 ~-32 ~32 ~32
$execute in overlimit:blood_world run tp @s $(x) 220 $(z)
effect give @s minecraft:slow_falling 20 0 true
