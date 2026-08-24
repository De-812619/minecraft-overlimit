# 通常: DISASTER 0.8% / CRISIS 1% / DANGER 5% / WARNING 10% / 通常 83.2%
execute store result score #roll overlimit.const run random value 0..499
execute if score #roll overlimit.const matches 0..3 run return run function overlimit:mob/make_disaster
execute if score #roll overlimit.const matches 4..8 run return run function overlimit:mob/make_crisis
execute if score #roll overlimit.const matches 9..33 run return run function overlimit:mob/make_danger
execute if score #roll overlimit.const matches 34..83 run return run function overlimit:mob/make_warning
