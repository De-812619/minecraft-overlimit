scoreboard players set #no_paused overlimit.const 0
function overlimit:nether_overflow/assign_core
function overlimit:nether_overflow/refresh_waypoint
tellraw @a[predicate=overlimit:in_overworld] {"text":"防衛を再開した。","color":"light_purple"}
