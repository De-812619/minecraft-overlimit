execute if entity @e[type=minecraft:marker,tag=overlimit.cc_reward_chest,distance=..0.8] run return run function overlimit:city_clamp/fill_chest
execute if block ~ ~ ~ #overlimit:reward_chest_keep run return fail
execute unless block ~ ~ ~ #overlimit:reward_chest_ok run return fail
setblock ~ ~ ~ minecraft:chest
data merge block ~ ~ ~ {CustomName:{"translate": "overlimit.chest.city_clamp","color":"blue"}}
summon minecraft:marker ~ ~ ~ {Tags:["overlimit.cc_reward_chest"]}
return run function overlimit:city_clamp/fill_chest
