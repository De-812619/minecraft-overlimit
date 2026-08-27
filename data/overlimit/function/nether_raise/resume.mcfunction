execute unless score #nr_paused overlimit.const matches 1 run return fail
scoreboard players set #nr_paused overlimit.const 0
function overlimit:nether_raise/refresh_waypoint
function overlimit:nether_raise/bossbar_value
function overlimit:nether_raise/bossbar_name
bossbar set overlimit:nether_raise players @a[predicate=overlimit:in_nether]
