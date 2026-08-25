# 新規の矢1本だけ見る。黄金弓から撃ったものなら速度2倍＋発光を付ける
tag @s add overlimit.gb_done
execute unless data entity @s weapon.components."minecraft:custom_data".overlimit.golden_bow run return fail
return run function overlimit:item/golden_bow/on_shot
