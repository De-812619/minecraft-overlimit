# 原点は必ず x/z を入れる（欠けるとマクロ関数が何もしない）。
execute unless score #bw_spawn_x overlimit.const matches -2147483648.. run scoreboard players set #bw_spawn_x overlimit.const 0
execute unless score #bw_spawn_z overlimit.const matches -2147483648.. run scoreboard players set #bw_spawn_z overlimit.const 0
scoreboard players operation #ox overlimit.const = #bw_spawn_x overlimit.const
scoreboard players operation #oz overlimit.const = #bw_spawn_z overlimit.const
execute if score #bw_origin_from_gate overlimit.const matches 1 run scoreboard players operation #ox overlimit.const = #bw_origin_x overlimit.const
execute if score #bw_origin_from_gate overlimit.const matches 1 run scoreboard players operation #oz overlimit.const = #bw_origin_z overlimit.const
data modify storage overlimit:portal origin.x set value 0
data modify storage overlimit:portal origin.z set value 0
execute store result storage overlimit:portal origin.x int 1 run scoreboard players get #ox overlimit.const
execute store result storage overlimit:portal origin.z int 1 run scoreboard players get #oz overlimit.const
