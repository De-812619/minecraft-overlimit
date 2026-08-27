scoreboard players set #nr_near overlimit.const 0
function overlimit:nether_raise/arrive_check with storage overlimit:nr target
execute if score #nr_near overlimit.const matches 0 run return fail
function overlimit:nether_raise/begin_combat
