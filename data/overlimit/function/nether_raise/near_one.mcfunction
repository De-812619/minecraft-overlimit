# @s = プレイヤー。#nr_cx/#nr_cz との水平八角形近似が #nr_near_lim 以下なら #nr_near_p=1
execute store result score #nr_px overlimit.const run data get entity @s Pos[0]
execute store result score #nr_pz overlimit.const run data get entity @s Pos[2]
scoreboard players operation #nr_dx overlimit.const = #nr_px overlimit.const
scoreboard players operation #nr_dx overlimit.const -= #nr_cx overlimit.const
scoreboard players operation #nr_dz overlimit.const = #nr_pz overlimit.const
scoreboard players operation #nr_dz overlimit.const -= #nr_cz overlimit.const
execute if score #nr_dx overlimit.const matches ..-1 run scoreboard players operation #nr_dx overlimit.const *= #-1 overlimit.const
execute if score #nr_dz overlimit.const matches ..-1 run scoreboard players operation #nr_dz overlimit.const *= #-1 overlimit.const
scoreboard players operation #nr_nmax overlimit.const = #nr_dx overlimit.const
scoreboard players operation #nr_nmin overlimit.const = #nr_dz overlimit.const
execute if score #nr_dz overlimit.const > #nr_dx overlimit.const run scoreboard players operation #nr_nmax overlimit.const = #nr_dz overlimit.const
execute if score #nr_dz overlimit.const > #nr_dx overlimit.const run scoreboard players operation #nr_nmin overlimit.const = #nr_dx overlimit.const
scoreboard players operation #nr_nmin overlimit.const *= #3 overlimit.const
scoreboard players operation #nr_nmin overlimit.const /= #8 overlimit.const
scoreboard players operation #nr_nmax overlimit.const += #nr_nmin overlimit.const
execute if score #nr_nmax overlimit.const <= #nr_near_lim overlimit.const run scoreboard players set #nr_near_p overlimit.const 1
