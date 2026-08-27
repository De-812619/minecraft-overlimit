execute if score #cc_spawned overlimit.const >= #cc_budget overlimit.const run return fail
scoreboard players set #cc_sretry overlimit.const 0
return run function overlimit:city_clamp/try_spawn_retry
