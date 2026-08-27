execute store result score #nr_gy overlimit.const run data get entity @e[type=minecraft:marker,tag=overlimit.nr_target,limit=1] Pos[1]
execute as @e[type=minecraft:marker,tag=overlimit.nr_target,limit=1] at @s run function overlimit:nether_raise/spawn_burst_here
