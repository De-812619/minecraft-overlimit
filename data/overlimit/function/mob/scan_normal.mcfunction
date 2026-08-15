# 通常: CRISIS 1% / DANGER 5% / WARNING 10% / 通常 84%
execute store result score #roll overlimit.const run random value 0..99
execute if score #roll overlimit.const matches 0 run return run function overlimit:mob/make_crisis
execute if score #roll overlimit.const matches 1..5 run return run function overlimit:mob/make_danger
execute if score #roll overlimit.const matches 6..15 run return run function overlimit:mob/make_warning
