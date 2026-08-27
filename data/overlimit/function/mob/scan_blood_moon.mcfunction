execute if predicate overlimit:in_trial_chambers run return run function overlimit:mob/scan_normal
execute unless entity @s[tag=overlimit.bm_wave] if function overlimit:blood_moon/near_spawner run return run function overlimit:mob/scan_normal

# BW はヒート非連動（従来 1/5/15/79）
execute if predicate overlimit:in_blood_world run return run function overlimit:mob/scan_blood_moon_bw

# OW BM: ヒート表（0..999）
execute store result score #roll overlimit.const run random value 0..999
execute if score #roll overlimit.const <= #bm_d_max overlimit.const run return run function overlimit:mob/scan_blood_moon_apply_d
execute if score #roll overlimit.const <= #bm_c_max overlimit.const run return run function overlimit:mob/scan_blood_moon_apply_c
execute if score #roll overlimit.const <= #bm_g_max overlimit.const run return run function overlimit:mob/scan_blood_moon_apply_g
function overlimit:mob/scan_blood_moon_apply_w
