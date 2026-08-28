execute store result score #cc_tx overlimit.const run data get storage overlimit:cc target.x
execute store result score #cc_tz overlimit.const run data get storage overlimit:cc target.z
execute store result score #cc_px overlimit.const run data get entity @s Pos[0]
execute store result score #cc_pz overlimit.const run data get entity @s Pos[2]
scoreboard players operation #cc_dx overlimit.const = #cc_tx overlimit.const
scoreboard players operation #cc_dx overlimit.const -= #cc_px overlimit.const
scoreboard players operation #cc_dz overlimit.const = #cc_tz overlimit.const
scoreboard players operation #cc_dz overlimit.const -= #cc_pz overlimit.const
scoreboard players set #cc_adx overlimit.const 0
scoreboard players set #cc_adz overlimit.const 0
execute if score #cc_dx overlimit.const matches ..-1 run scoreboard players operation #cc_adx overlimit.const = #cc_dx overlimit.const
execute if score #cc_dx overlimit.const matches ..-1 run scoreboard players operation #cc_adx overlimit.const *= #-1 overlimit.const
execute if score #cc_dx overlimit.const matches 0.. run scoreboard players operation #cc_adx overlimit.const = #cc_dx overlimit.const
execute if score #cc_dz overlimit.const matches ..-1 run scoreboard players operation #cc_adz overlimit.const = #cc_dz overlimit.const
execute if score #cc_dz overlimit.const matches ..-1 run scoreboard players operation #cc_adz overlimit.const *= #-1 overlimit.const
execute if score #cc_dz overlimit.const matches 0.. run scoreboard players operation #cc_adz overlimit.const = #cc_dz overlimit.const
# 水平距離の八角形近似 max + 3/8*min（真値との誤差は最大約3%）
scoreboard players operation #cc_gmax overlimit.const = #cc_adx overlimit.const
scoreboard players operation #cc_gmin overlimit.const = #cc_adz overlimit.const
execute if score #cc_adz overlimit.const > #cc_adx overlimit.const run scoreboard players operation #cc_gmax overlimit.const = #cc_adz overlimit.const
execute if score #cc_adz overlimit.const > #cc_adx overlimit.const run scoreboard players operation #cc_gmin overlimit.const = #cc_adx overlimit.const
scoreboard players operation #cc_gmin overlimit.const *= #3 overlimit.const
scoreboard players operation #cc_gmin overlimit.const /= #8 overlimit.const
scoreboard players operation #cc_best overlimit.const = #cc_gmax overlimit.const
scoreboard players operation #cc_best overlimit.const += #cc_gmin overlimit.const
# 方角の案内はロケーターバーのウェイポイントが担うので、ここでは
# ボスバーの進捗に使う戦場までの距離だけを求める
