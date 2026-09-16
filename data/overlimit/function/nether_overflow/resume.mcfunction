scoreboard players set #no_paused overlimit.const 0
function overlimit:nether_overflow/assign_core
function overlimit:nether_overflow/refresh_waypoint
tellraw @a[predicate=overlimit:in_overworld] {"translate": "overlimit.msg.no.resume","color":"light_purple"}
