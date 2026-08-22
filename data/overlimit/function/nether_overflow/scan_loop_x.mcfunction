scoreboard players operation #no_xx overlimit.const = #no_nx overlimit.const
scoreboard players operation #no_xx overlimit.const *= #no_nx overlimit.const
scoreboard players operation #no_zz overlimit.const = #no_nz overlimit.const
scoreboard players operation #no_zz overlimit.const *= #no_nz overlimit.const
scoreboard players operation #no_sum overlimit.const = #no_xx overlimit.const
scoreboard players operation #no_sum overlimit.const += #no_zz overlimit.const
execute if score #no_sum overlimit.const <= #no_rr overlimit.const run function overlimit:nether_overflow/scan_at
scoreboard players add #no_nx overlimit.const 2
execute if score #no_nx overlimit.const <= #no_rad overlimit.const run function overlimit:nether_overflow/scan_loop_x
