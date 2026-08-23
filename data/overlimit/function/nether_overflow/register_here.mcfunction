execute as @e[type=minecraft:marker,tag=overlimit.no_gate,distance=..4,limit=1] at @s run function overlimit:nether_overflow/remember_gate
execute if entity @e[type=minecraft:marker,tag=overlimit.no_gate,distance=..4] run return fail
execute align xyz run summon minecraft:marker ~0.5 ~ ~0.5 {Tags:["overlimit.no_gate"]}
execute as @n[type=minecraft:marker,tag=overlimit.no_gate,distance=..2] at @s run function overlimit:nether_overflow/remember_gate
return 1
