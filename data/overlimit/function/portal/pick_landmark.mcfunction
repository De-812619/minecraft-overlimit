# 実行者の XZ（OWならその座標）を BW 上の原点にして、未使用の陸地構造物を1つ選ぶ。
scoreboard players set #bw_found overlimit.const 0
scoreboard players set #bw_survey_ok overlimit.const 0
data remove storage overlimit:portal origin
data remove storage overlimit:portal landmark
execute unless score #bw_spawn_x overlimit.const matches -2147483648.. run scoreboard players set #bw_spawn_x overlimit.const 0
execute unless score #bw_spawn_z overlimit.const matches -2147483648.. run scoreboard players set #bw_spawn_z overlimit.const 0
scoreboard players operation #bw_px overlimit.const = #bw_spawn_x overlimit.const
scoreboard players operation #bw_pz overlimit.const = #bw_spawn_z overlimit.const
execute if entity @s[type=player] store result score #bw_px overlimit.const run data get entity @s Pos[0]
execute if entity @s[type=player] store result score #bw_pz overlimit.const run data get entity @s Pos[2]
execute store result storage overlimit:portal pick.px int 1 run scoreboard players get #bw_px overlimit.const
execute store result storage overlimit:portal pick.pz int 1 run scoreboard players get #bw_pz overlimit.const
return run function overlimit:portal/pick_at with storage overlimit:portal pick
