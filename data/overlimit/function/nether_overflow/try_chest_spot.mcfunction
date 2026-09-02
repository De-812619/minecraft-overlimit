# 実行位置のブロックへ報酬チェスト。既存の報酬チェストなら中身を足す（同じマスの2人用）。
execute if entity @e[type=minecraft:marker,tag=overlimit.no_reward_chest,distance=..0.8] run return run function overlimit:nether_overflow/fill_chest
execute unless block ~ ~ ~ #minecraft:replaceable run return fail
setblock ~ ~ ~ minecraft:chest
data merge block ~ ~ ~ {CustomName:{"text":"ネザーオーバーフローの報酬","color":"light_purple"}}
summon minecraft:marker ~ ~ ~ {Tags:["overlimit.no_reward_chest"]}
return run function overlimit:nether_overflow/fill_chest
