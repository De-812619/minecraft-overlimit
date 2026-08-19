# 実行位置のブロックへ報酬チェスト。既存の報酬チェストなら本を足す（同じマスの2人用）。
execute if entity @e[type=minecraft:marker,tag=overlimit.bm_reward_chest,distance=..0.8] run return run function overlimit:blood_moon/fill_chest
execute unless block ~ ~ ~ #minecraft:replaceable run return fail
setblock ~ ~ ~ minecraft:chest
data merge block ~ ~ ~ {CustomName:{"text":"ブラッドムーンの報酬","color":"gold"}}
summon minecraft:marker ~ ~ ~ {Tags:["overlimit.bm_reward_chest"]}
return run function overlimit:blood_moon/fill_chest
