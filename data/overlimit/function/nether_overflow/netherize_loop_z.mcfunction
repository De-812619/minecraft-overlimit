scoreboard players operation #no_nx overlimit.const = #no_rad overlimit.const
scoreboard players operation #no_nx overlimit.const *= #-1 overlimit.const
function overlimit:nether_overflow/netherize_loop_x
scoreboard players add #no_nz overlimit.const 2
execute if score #no_nz overlimit.const <= #no_rad overlimit.const run function overlimit:nether_overflow/netherize_loop_z
