# オーバーワールドに生存者がいない夜は開始しない（BW 滞在中に OW 側が起きると間引きが衝突していた）。
scoreboard players set #bm_ow_pl overlimit.const 0
execute as @a[gamemode=!spectator] at @s if dimension minecraft:overworld run scoreboard players set #bm_ow_pl overlimit.const 1
execute unless score #bm_ow_pl overlimit.const matches 1 run return fail

scoreboard players set #bm_checked overlimit.const 1
execute if score #no_active overlimit.const matches 1 run return fail
scoreboard players operation #bm_mod overlimit.const = #bm_daynow overlimit.const
scoreboard players operation #bm_mod overlimit.const %= #3 overlimit.const
execute unless score #bm_mod overlimit.const matches 2 run return fail
scoreboard players operation #bm_roll_max overlimit.const = #bm_chance overlimit.const
scoreboard players operation #bm_roll_max overlimit.const += #pressure_bm_bonus overlimit.const
execute if score #bm_roll_max overlimit.const > #bm_chance_cap overlimit.const run scoreboard players operation #bm_roll_max overlimit.const = #bm_chance_cap overlimit.const

execute store result score #bm_roll overlimit.const run random value 0..99
execute if score #bm_roll overlimit.const < #bm_roll_max overlimit.const run return run function overlimit:blood_moon/start

# 外れ: 次回判定の確率を上げる（上限 100%）
scoreboard players operation #bm_chance overlimit.const += #bm_chance_step overlimit.const
execute if score #bm_chance overlimit.const > #bm_chance_cap overlimit.const run scoreboard players operation #bm_chance overlimit.const = #bm_chance_cap overlimit.const
