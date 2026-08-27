execute store result score #nr_ox overlimit.const run random value -16..16
execute store result score #nr_oz overlimit.const run random value -16..16
execute store result storage overlimit:nr spawn.x int 1 run scoreboard players get #nr_ox overlimit.const
execute store result storage overlimit:nr spawn.z int 1 run scoreboard players get #nr_oz overlimit.const
execute store success score #nr_sok overlimit.const run function overlimit:nether_raise/spawn_at with storage overlimit:nr spawn
execute if score #nr_sok overlimit.const matches 1 run return 1
scoreboard players add #nr_sretry overlimit.const 1
execute if score #nr_sretry overlimit.const matches ..2 run return run function overlimit:nether_raise/try_spawn_retry
return fail
