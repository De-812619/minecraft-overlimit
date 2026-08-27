execute store result score #cc_ox overlimit.const run random value -16..16
execute store result score #cc_oz overlimit.const run random value -16..16
execute store result storage overlimit:cc spawn.x int 1 run scoreboard players get #cc_ox overlimit.const
execute store result storage overlimit:cc spawn.z int 1 run scoreboard players get #cc_oz overlimit.const
execute store success score #cc_sok overlimit.const run function overlimit:city_clamp/spawn_at with storage overlimit:cc spawn
execute if score #cc_sok overlimit.const matches 1 run return 1
scoreboard players add #cc_sretry overlimit.const 1
execute if score #cc_sretry overlimit.const matches ..2 run return run function overlimit:city_clamp/try_spawn_retry
return fail
