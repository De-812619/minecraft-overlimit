scoreboard players set #no_spawn_t overlimit.const 0
overlimit event_mobs no_alive
execute if score #no_alive overlimit.const >= #no_cap overlimit.const run return fail
execute as @e[type=minecraft:marker,tag=overlimit.no_target,limit=1] at @s run function overlimit:nether_overflow/try_spawn
overlimit event_mobs no_alive
execute if score #no_alive overlimit.const >= #no_cap overlimit.const run return fail
execute as @e[type=minecraft:marker,tag=overlimit.no_target,limit=1] at @s run function overlimit:nether_overflow/try_spawn
