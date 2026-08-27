execute if entity @e[tag=overlimit.cc_ghast,limit=1] run return fail
execute store result score #cc_ox overlimit.const run random value -16..16
execute store result score #cc_oz overlimit.const run random value -16..16
execute store result storage overlimit:cc spawn.x int 1 run scoreboard players get #cc_ox overlimit.const
execute store result storage overlimit:cc spawn.z int 1 run scoreboard players get #cc_oz overlimit.const
function overlimit:city_clamp/spawn_ghast_at with storage overlimit:cc spawn
