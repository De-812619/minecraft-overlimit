execute if score #cc_burst overlimit.const matches 6.. run return fail
function overlimit:city_clamp/try_spawn
scoreboard players add #cc_burst overlimit.const 1
execute if score #cc_burst overlimit.const matches ..5 run function overlimit:city_clamp/spawn_burst_loop
