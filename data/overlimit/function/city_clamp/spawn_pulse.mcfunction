scoreboard players set #cc_spawn_t overlimit.const 0
execute store result score #cc_alive overlimit.const if entity @e[tag=overlimit.cc_wave]
execute if score #cc_alive overlimit.const >= #cc_cap overlimit.const run return fail
execute as @e[type=minecraft:marker,tag=overlimit.cc_target,limit=1] at @s run function overlimit:city_clamp/try_spawn
execute store result score #cc_alive overlimit.const if entity @e[tag=overlimit.cc_wave]
execute if score #cc_alive overlimit.const >= #cc_cap overlimit.const run return fail
execute as @e[type=minecraft:marker,tag=overlimit.cc_target,limit=1] at @s run function overlimit:city_clamp/try_spawn
