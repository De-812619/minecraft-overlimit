# @s = candidate corpse. Accept Health 0 (CustomName allowed here — kill backup).
execute if score #necro_type overlimit.const matches 1.. run return fail
execute if entity @s[type=#overlimit:necromancy_exclude] run return fail
execute store result score #hp overlimit.const run data get entity @s Health 10
execute unless score #hp overlimit.const matches ..0 run return fail
function overlimit:enchant/necromancy/encode_type
