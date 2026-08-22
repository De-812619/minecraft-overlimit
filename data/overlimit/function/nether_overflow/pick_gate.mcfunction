tag @e[type=minecraft:marker,tag=overlimit.no_gate] remove overlimit.no_target
tag @e[type=minecraft:marker,tag=overlimit.no_gate] remove overlimit.no_best
scoreboard players set #no_best overlimit.const 2147483647
execute as @e[type=minecraft:marker,tag=overlimit.no_gate] at @s run function overlimit:nether_overflow/consider_gate
execute as @e[type=minecraft:marker,tag=overlimit.no_best,limit=1] run tag @s add overlimit.no_target
tag @e[type=minecraft:marker,tag=overlimit.no_gate] remove overlimit.no_best
