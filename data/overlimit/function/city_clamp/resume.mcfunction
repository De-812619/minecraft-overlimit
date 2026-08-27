execute unless score #cc_paused overlimit.const matches 1 run return fail
scoreboard players set #cc_paused overlimit.const 0
function overlimit:city_clamp/refresh_waypoint
function overlimit:city_clamp/bossbar_value
function overlimit:city_clamp/bossbar_name
bossbar set overlimit:city_clamp players @a[predicate=overlimit:in_the_end]
