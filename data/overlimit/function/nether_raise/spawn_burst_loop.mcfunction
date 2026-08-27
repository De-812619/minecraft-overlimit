execute if score #nr_burst overlimit.const matches 6.. run return fail
function overlimit:nether_raise/try_spawn
scoreboard players add #nr_burst overlimit.const 1
execute if score #nr_burst overlimit.const matches ..5 run function overlimit:nether_raise/spawn_burst_loop
