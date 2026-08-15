execute if predicate overlimit:in_trial_chambers run return run function overlimit:mob/scan_normal
execute if function overlimit:blood_moon/near_spawner run return run function overlimit:mob/scan_normal

# ブラッドムーン: CRISIS 5% / DANGER 15% / WARNING 80%
execute store result score #roll overlimit.const run random value 0..99
execute if score #roll overlimit.const matches 0..4 run function overlimit:mob/make_crisis
execute if score #roll overlimit.const matches 5..19 run function overlimit:mob/make_danger
execute if score #roll overlimit.const matches 20..99 run function overlimit:mob/make_warning
function overlimit:blood_moon/mark_elite
