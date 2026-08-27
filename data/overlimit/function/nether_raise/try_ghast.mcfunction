execute if entity @e[tag=overlimit.nr_ghast,limit=1] run return fail
execute store result score #nr_ox overlimit.const run random value -16..16
execute store result score #nr_oz overlimit.const run random value -16..16
execute store result storage overlimit:nr spawn.x int 1 run scoreboard players get #nr_ox overlimit.const
execute store result storage overlimit:nr spawn.z int 1 run scoreboard players get #nr_oz overlimit.const
function overlimit:nether_raise/spawn_ghast_at with storage overlimit:nr spawn
