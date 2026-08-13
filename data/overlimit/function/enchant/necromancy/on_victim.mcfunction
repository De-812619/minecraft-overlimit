# @s = victim. Remember type for upcoming kill (no CustomName filter).
execute if entity @s[type=#overlimit:necromancy_exclude] run return fail
execute if entity @s[tag=overlimit.elite] run return fail
execute if entity @s[tag=overlimit.summon] run return fail
execute if entity @s[tag=overlimit.necro] run return fail
execute unless entity @s[type=#overlimit:can_be_danger] run return fail

function overlimit:enchant/necromancy/encode_type
execute unless score #necro_type overlimit.const matches 1.. run return fail
execute as @p[distance=..10] run function overlimit:enchant/necromancy/stash_type
