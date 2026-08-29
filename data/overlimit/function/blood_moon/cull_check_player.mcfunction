# @s = プレイヤー。#bm_mx/#bm_my/#bm_mz は対象Mob。
execute store result score #bm_px overlimit.const run data get entity @s Pos[0]
execute store result score #bm_py2 overlimit.const run data get entity @s Pos[1]
execute store result score #bm_pz overlimit.const run data get entity @s Pos[2]

scoreboard players operation #bm_dx overlimit.const = #bm_px overlimit.const
scoreboard players operation #bm_dx overlimit.const -= #bm_mx overlimit.const
execute if score #bm_dx overlimit.const matches ..-1 run scoreboard players operation #bm_dx overlimit.const *= #-1 overlimit.const

scoreboard players operation #bm_dz overlimit.const = #bm_pz overlimit.const
scoreboard players operation #bm_dz overlimit.const -= #bm_mz overlimit.const
execute if score #bm_dz overlimit.const matches ..-1 run scoreboard players operation #bm_dz overlimit.const *= #-1 overlimit.const

scoreboard players operation #bm_dy2 overlimit.const = #bm_py2 overlimit.const
scoreboard players operation #bm_dy2 overlimit.const -= #bm_my overlimit.const
execute if score #bm_dy2 overlimit.const matches ..-1 run scoreboard players operation #bm_dy2 overlimit.const *= #-1 overlimit.const

# 水平16以内（追加スポーン距離）は高さ不問。
execute if score #bm_dx overlimit.const matches ..16 if score #bm_dz overlimit.const matches ..16 run scoreboard players set #bm_keep overlimit.const 1
execute if score #bm_keep overlimit.const matches 1 run return fail

# 水平25以内かつ高さ±8。
execute if score #bm_dx overlimit.const matches ..25 if score #bm_dz overlimit.const matches ..25 if score #bm_dy2 overlimit.const matches ..8 run scoreboard players set #bm_keep overlimit.const 1
