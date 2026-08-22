execute if entity @e[type=minecraft:marker,tag=overlimit.no_reward_chest,distance=..0.8] if block ~ ~ ~ minecraft:chest run return run function overlimit:nether_overflow/fill_chest
execute if entity @e[type=minecraft:marker,tag=overlimit.no_reward_chest,distance=..0.8] unless block ~ ~ ~ minecraft:chest run kill @e[type=minecraft:marker,tag=overlimit.no_reward_chest,distance=..0.8]
execute if block ~ ~ ~ #overlimit:reward_chest_keep run return fail
setblock ~ ~ ~ minecraft:chest
execute unless block ~ ~ ~ minecraft:chest run return fail
data merge block ~ ~ ~ {CustomName:{"text":"ネザーオーバーフローの報酬","color":"light_purple"}}
summon minecraft:marker ~ ~ ~ {Tags:["overlimit.no_reward_chest"]}
return run function overlimit:nether_overflow/fill_chest
