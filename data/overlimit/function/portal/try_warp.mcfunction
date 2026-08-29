execute if predicate overlimit:in_overworld if score #bm_active overlimit.const matches 1 run return run function overlimit:portal/deny
scoreboard players set @s overlimit.portal_cd 80
scoreboard players set @s overlimit.portal_charge 0
function overlimit:portal/release
tag @s remove overlimit.to_bw
tag @s remove overlimit.to_ow
execute if predicate overlimit:in_overworld run tag @s add overlimit.to_bw
execute if predicate overlimit:in_blood_world run tag @s add overlimit.to_ow
execute at @s run playsound minecraft:block.portal.travel player @s ~ ~ ~ 0.8 1
execute if predicate overlimit:in_overworld run function overlimit:portal/mark_ow
execute if predicate overlimit:in_overworld run return run function overlimit:portal/to_blood
execute if predicate overlimit:in_blood_world if score @s overlimit.ow_has matches 1 run return run function overlimit:portal/to_ow_gate
execute if predicate overlimit:in_blood_world run return run function overlimit:portal/to_overworld
