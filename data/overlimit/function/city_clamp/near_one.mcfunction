execute store result score #cc_px overlimit.const run data get entity @s Pos[0]
execute store result score #cc_pz overlimit.const run data get entity @s Pos[2]
scoreboard players operation #cc_dx overlimit.const = #cc_px overlimit.const
scoreboard players operation #cc_dx overlimit.const -= #cc_cx overlimit.const
scoreboard players operation #cc_dz overlimit.const = #cc_pz overlimit.const
scoreboard players operation #cc_dz overlimit.const -= #cc_cz overlimit.const
execute if score #cc_dx overlimit.const matches ..-1 run scoreboard players operation #cc_dx overlimit.const *= #-1 overlimit.const
execute if score #cc_dz overlimit.const matches ..-1 run scoreboard players operation #cc_dz overlimit.const *= #-1 overlimit.const
scoreboard players operation #cc_nmax overlimit.const = #cc_dx overlimit.const
scoreboard players operation #cc_nmin overlimit.const = #cc_dz overlimit.const
execute if score #cc_dz overlimit.const > #cc_dx overlimit.const run scoreboard players operation #cc_nmax overlimit.const = #cc_dz overlimit.const
execute if score #cc_dz overlimit.const > #cc_dx overlimit.const run scoreboard players operation #cc_nmin overlimit.const = #cc_dx overlimit.const
scoreboard players operation #cc_nmin overlimit.const *= #3 overlimit.const
scoreboard players operation #cc_nmin overlimit.const /= #8 overlimit.const
scoreboard players operation #cc_nmax overlimit.const += #cc_nmin overlimit.const
execute if score #cc_nmax overlimit.const <= #cc_near_lim overlimit.const run scoreboard players set #cc_near_p overlimit.const 1
