scoreboard players set #bm_checked overlimit.const 1
scoreboard players operation #bm_mod overlimit.const = #bm_daynow overlimit.const
scoreboard players operation #bm_mod overlimit.const %= #3 overlimit.const
execute unless score #bm_mod overlimit.const matches 2 run return fail

execute store result score #bm_roll overlimit.const run random value 0..99
execute if score #bm_roll overlimit.const < #bm_chance overlimit.const run return run function overlimit:blood_moon/start

# 外れ: 次回判定の確率を上げる（上限 100%）
scoreboard players operation #bm_chance overlimit.const += #bm_chance_step overlimit.const
execute if score #bm_chance overlimit.const > #bm_chance_cap overlimit.const run scoreboard players operation #bm_chance overlimit.const = #bm_chance_cap overlimit.const
