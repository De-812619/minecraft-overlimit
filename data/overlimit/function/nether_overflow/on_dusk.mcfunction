scoreboard players set #no_dusk_checked overlimit.const 1
scoreboard players add #no_dusk overlimit.const 1
execute if score #no_active overlimit.const matches 1 run return fail
execute if score #bm_active overlimit.const matches 1 run return fail
execute if score #no_dusk overlimit.const < #no_interval overlimit.const run return fail
function overlimit:nether_overflow/try_start
