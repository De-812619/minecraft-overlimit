scoreboard players set #bm_checked overlimit.const 1
scoreboard players operation #bm_mod overlimit.const = #bm_daynow overlimit.const
scoreboard players operation #bm_mod overlimit.const %= #3 overlimit.const
execute unless score #bm_mod overlimit.const matches 2 run return fail

execute store result score #bm_roll overlimit.const run random value 0..99
execute if score #bm_roll overlimit.const matches 0..29 run function overlimit:blood_moon/start
