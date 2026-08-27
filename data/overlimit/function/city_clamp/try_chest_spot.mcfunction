execute if entity @e[type=minecraft:marker,tag=overlimit.cc_reward_chest,distance=..0.8] run return run function overlimit:city_clamp/fill_chest
execute unless block ~ ~ ~ #minecraft:replaceable run return fail
setblock ~ ~ ~ minecraft:chest
data merge block ~ ~ ~ {CustomName:{"text":"シティクランプの報酬","color":"blue"}}
summon minecraft:marker ~ ~ ~ {Tags:["overlimit.cc_reward_chest"]}
return run function overlimit:city_clamp/fill_chest
