scoreboard players set #nr_spawn_t overlimit.const 0
overlimit event_mobs nr_alive
execute if score #nr_alive overlimit.const >= #nr_cap overlimit.const run return fail
execute as @e[type=minecraft:marker,tag=overlimit.nr_target,limit=1] at @s run function overlimit:nether_raise/try_spawn
overlimit event_mobs nr_alive
execute if score #nr_alive overlimit.const >= #nr_cap overlimit.const run return fail
execute as @e[type=minecraft:marker,tag=overlimit.nr_target,limit=1] at @s run function overlimit:nether_raise/try_spawn
