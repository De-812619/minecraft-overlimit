scoreboard players operation #no_rad overlimit.const = #no_scan_r overlimit.const
scoreboard players operation #no_rr overlimit.const = #no_rad overlimit.const
scoreboard players operation #no_rr overlimit.const *= #no_rad overlimit.const
scoreboard players operation #no_nz overlimit.const = #no_rad overlimit.const
scoreboard players operation #no_nz overlimit.const *= #-1 overlimit.const
function overlimit:nether_overflow/scan_loop_z
