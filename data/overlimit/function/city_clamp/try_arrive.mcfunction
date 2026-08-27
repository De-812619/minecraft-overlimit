scoreboard players set #cc_near overlimit.const 0
function overlimit:city_clamp/arrive_check with storage overlimit:cc target
execute if score #cc_near overlimit.const matches 0 run return fail
function overlimit:city_clamp/begin_combat
