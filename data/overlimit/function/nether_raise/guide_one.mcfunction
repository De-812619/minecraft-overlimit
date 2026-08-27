execute store result score #nr_tx overlimit.const run data get storage overlimit:nr target.x
execute store result score #nr_tz overlimit.const run data get storage overlimit:nr target.z
execute store result score #nr_px overlimit.const run data get entity @s Pos[0]
execute store result score #nr_pz overlimit.const run data get entity @s Pos[2]
scoreboard players operation #nr_dx overlimit.const = #nr_tx overlimit.const
scoreboard players operation #nr_dx overlimit.const -= #nr_px overlimit.const
scoreboard players operation #nr_dz overlimit.const = #nr_tz overlimit.const
scoreboard players operation #nr_dz overlimit.const -= #nr_pz overlimit.const
scoreboard players set #nr_adx overlimit.const 0
scoreboard players set #nr_adz overlimit.const 0
execute if score #nr_dx overlimit.const matches ..-1 run scoreboard players operation #nr_adx overlimit.const = #nr_dx overlimit.const
execute if score #nr_dx overlimit.const matches ..-1 run scoreboard players operation #nr_adx overlimit.const *= #-1 overlimit.const
execute if score #nr_dx overlimit.const matches 0.. run scoreboard players operation #nr_adx overlimit.const = #nr_dx overlimit.const
execute if score #nr_dz overlimit.const matches ..-1 run scoreboard players operation #nr_adz overlimit.const = #nr_dz overlimit.const
execute if score #nr_dz overlimit.const matches ..-1 run scoreboard players operation #nr_adz overlimit.const *= #-1 overlimit.const
execute if score #nr_dz overlimit.const matches 0.. run scoreboard players operation #nr_adz overlimit.const = #nr_dz overlimit.const
# 水平距離の八角形近似 max + 3/8*min（真値との誤差は最大約3%）
scoreboard players operation #nr_gmax overlimit.const = #nr_adx overlimit.const
scoreboard players operation #nr_gmin overlimit.const = #nr_adz overlimit.const
execute if score #nr_adz overlimit.const > #nr_adx overlimit.const run scoreboard players operation #nr_gmax overlimit.const = #nr_adz overlimit.const
execute if score #nr_adz overlimit.const > #nr_adx overlimit.const run scoreboard players operation #nr_gmin overlimit.const = #nr_adx overlimit.const
scoreboard players operation #nr_gmin overlimit.const *= #3 overlimit.const
scoreboard players operation #nr_gmin overlimit.const /= #8 overlimit.const
scoreboard players operation #nr_best overlimit.const = #nr_gmax overlimit.const
scoreboard players operation #nr_best overlimit.const += #nr_gmin overlimit.const
# 方角の案内はロケーターバーのウェイポイントが担うので、ここでは
# ボスバーの進捗に使う会場までの距離だけを求める
