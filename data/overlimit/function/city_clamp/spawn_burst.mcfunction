execute store result score #cc_gy overlimit.const run data get entity @e[type=minecraft:marker,tag=overlimit.cc_target,limit=1] Pos[1]
execute as @e[type=minecraft:marker,tag=overlimit.cc_target,limit=1] at @s run function overlimit:city_clamp/spawn_burst_here
