tag @s add overlimit.scanned
execute if data entity @s CustomName run return fail

execute if predicate overlimit:in_blood_world if entity @s[type=#overlimit:piglin] run return run function overlimit:mob/scan_blood_world_piglin
execute if score #bm_active overlimit.const matches 1 if predicate overlimit:in_overworld run return run function overlimit:mob/scan_blood_moon
execute if score #bw_active overlimit.const matches 1 if predicate overlimit:in_blood_world run return run function overlimit:mob/scan_blood_moon
function overlimit:mob/scan_normal
