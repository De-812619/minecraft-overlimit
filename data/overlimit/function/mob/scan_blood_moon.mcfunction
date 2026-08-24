execute if predicate overlimit:in_trial_chambers run return run function overlimit:mob/scan_normal
execute unless entity @s[tag=overlimit.bm_wave] if function overlimit:blood_moon/near_spawner run return run function overlimit:mob/scan_normal

# ブラッドムーン: DISASTER 1% / CRISIS 5% / DANGER 15% / WARNING 79%
execute store result score #roll overlimit.const run random value 0..99
execute if score #roll overlimit.const matches 0 run function overlimit:mob/make_disaster
execute if score #roll overlimit.const matches 1..5 run function overlimit:mob/make_crisis
execute if score #roll overlimit.const matches 6..20 run function overlimit:mob/make_danger
execute if score #roll overlimit.const matches 21..99 run function overlimit:mob/make_warning
function overlimit:blood_moon/mark_elite
tag @s add overlimit.scanned
