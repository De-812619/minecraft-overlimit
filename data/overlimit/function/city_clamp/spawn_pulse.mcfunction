scoreboard players set #cc_spawn_t overlimit.const 0
overlimit event_mobs cc_alive
execute if score #cc_alive overlimit.const >= #cc_cap overlimit.const run return fail
execute as @e[type=minecraft:marker,tag=overlimit.cc_target,limit=1] at @s run function overlimit:city_clamp/try_spawn
overlimit event_mobs cc_alive
execute if score #cc_alive overlimit.const >= #cc_cap overlimit.const run return fail
execute as @e[type=minecraft:marker,tag=overlimit.cc_target,limit=1] at @s run function overlimit:city_clamp/try_spawn
