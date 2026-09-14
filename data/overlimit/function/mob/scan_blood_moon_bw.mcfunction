# ブラッドワールド: DISASTER 1% / CRISIS 5% / DANGER 15% / WARNING 79%
execute store result score #roll overlimit.const run random value 0..99
execute if score #roll overlimit.const matches 0 run function overlimit:mob/make_disaster
execute if score #roll overlimit.const matches 1..5 run function overlimit:mob/make_crisis
execute if score #roll overlimit.const matches 6..20 run function overlimit:mob/make_danger
execute if score #roll overlimit.const matches 21..99 unless score #bw_omen overlimit.const matches 1 run function overlimit:mob/make_warning
execute if score #roll overlimit.const matches 21..99 if score #bw_omen overlimit.const matches 1 run function overlimit:mob/make_danger
tag @s add overlimit.bm_bw
function overlimit:blood_moon/mark_elite
tag @s add overlimit.scanned
