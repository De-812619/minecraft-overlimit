execute if score #no_spawned overlimit.const >= #no_budget overlimit.const run return fail

execute store result score #no_ox overlimit.const run random value -16..16
execute store result score #no_oz overlimit.const run random value -16..16
execute store result storage overlimit:no spawn.x int 1 run scoreboard players get #no_ox overlimit.const
execute store result storage overlimit:no spawn.z int 1 run scoreboard players get #no_oz overlimit.const
function overlimit:nether_overflow/spawn_at with storage overlimit:no spawn
