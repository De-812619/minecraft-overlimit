execute if entity @e[type=minecraft:marker,tag=overlimit.no_gate,distance=..4] run return fail
execute align xyz run summon minecraft:marker ~0.5 ~ ~0.5 {Tags:["overlimit.no_gate"]}
return 1
