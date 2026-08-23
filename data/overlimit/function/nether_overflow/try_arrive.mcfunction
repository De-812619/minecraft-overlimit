execute unless function overlimit:nether_overflow/player_near_gate run return fail
function overlimit:nether_overflow/respawn_target
execute unless entity @e[type=minecraft:marker,tag=overlimit.no_target] run return fail
scoreboard players set #no_arrived overlimit.const 1
scoreboard players set #no_spawn_t overlimit.const 0
execute as @e[type=minecraft:marker,tag=overlimit.no_target,limit=1] at @s run function overlimit:nether_overflow/spawn_burst
execute as @e[type=minecraft:marker,tag=overlimit.no_target,limit=1] at @s run function overlimit:nether_overflow/ensure_ghast
