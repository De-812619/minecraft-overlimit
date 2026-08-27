execute if score #nr_spawned overlimit.const >= #nr_budget overlimit.const run return fail
scoreboard players set #nr_sretry overlimit.const 0
return run function overlimit:nether_raise/try_spawn_retry
