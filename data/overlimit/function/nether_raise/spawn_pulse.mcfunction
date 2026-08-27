scoreboard players set #nr_spawn_t overlimit.const 0
execute store result score #nr_alive overlimit.const if entity @e[tag=overlimit.nr_wave]
execute if score #nr_alive overlimit.const >= #nr_cap overlimit.const run return fail
execute as @e[type=minecraft:marker,tag=overlimit.nr_target,limit=1] at @s run function overlimit:nether_raise/try_spawn
execute store result score #nr_alive overlimit.const if entity @e[tag=overlimit.nr_wave]
execute if score #nr_alive overlimit.const >= #nr_cap overlimit.const run return fail
execute as @e[type=minecraft:marker,tag=overlimit.nr_target,limit=1] at @s run function overlimit:nether_raise/try_spawn
