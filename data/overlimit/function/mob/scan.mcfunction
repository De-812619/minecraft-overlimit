tag @s add overlimit.scanned
execute if data entity @s CustomName run return fail

execute if score #bm_active overlimit.const matches 1 if dimension minecraft:overworld run return run function overlimit:mob/scan_blood_moon
function overlimit:mob/scan_normal
