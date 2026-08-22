execute unless score #no_nethering overlimit.const matches 1 run return fail
execute if score #no_nz overlimit.const > #no_rad overlimit.const run return run function overlimit:nether_overflow/netherize_finish
scoreboard players operation #no_nx overlimit.const = #no_nrad overlimit.const
function overlimit:nether_overflow/netherize_loop_x
scoreboard players add #no_nz overlimit.const 1
