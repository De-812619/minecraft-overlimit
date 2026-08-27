execute if entity @e[type=minecraft:marker,tag=overlimit.nr_reward_chest,distance=..0.8] run return run function overlimit:nether_raise/fill_chest
execute unless block ~ ~ ~ #minecraft:replaceable run return fail
setblock ~ ~ ~ minecraft:chest
data merge block ~ ~ ~ {CustomName:{"text":"ネザーレイズの報酬","color":"gold"}}
summon minecraft:marker ~ ~ ~ {Tags:["overlimit.nr_reward_chest"]}
return run function overlimit:nether_raise/fill_chest
