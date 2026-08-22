scoreboard players set #no_spawn_t overlimit.const 0
execute store result score #no_alive overlimit.const if entity @e[tag=overlimit.no_wave]
execute if score #no_alive overlimit.const >= #no_cap overlimit.const run return fail
execute as @e[type=minecraft:marker,tag=overlimit.no_target,limit=1] at @s run function overlimit:nether_overflow/try_spawn
execute store result score #no_alive overlimit.const if entity @e[tag=overlimit.no_wave]
execute if score #no_alive overlimit.const >= #no_cap overlimit.const run return fail
execute as @e[type=minecraft:marker,tag=overlimit.no_target,limit=1] at @s run function overlimit:nether_overflow/try_spawn
