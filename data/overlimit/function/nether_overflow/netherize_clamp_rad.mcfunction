execute if score #no_rad overlimit.const > #no_rmax overlimit.const run scoreboard players operation #no_rad overlimit.const = #no_rmax overlimit.const
execute if score #no_rad overlimit.const < #no_r0 overlimit.const run scoreboard players operation #no_rad overlimit.const = #no_r0 overlimit.const
execute store result storage overlimit:no neth.r int 1 run scoreboard players get #no_rad overlimit.const
scoreboard players operation #no_nrad overlimit.const = #no_rad overlimit.const
scoreboard players operation #no_nrad overlimit.const *= #-1 overlimit.const
execute store result storage overlimit:no neth.nr int 1 run scoreboard players get #no_nrad overlimit.const
return 1
