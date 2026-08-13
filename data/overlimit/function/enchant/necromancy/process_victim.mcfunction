# @s = hit victim at victim.
execute if entity @s[type=#overlimit:necromancy_exclude] run return fail
execute if data entity @s CustomName run return fail

function overlimit:enchant/necromancy/encode_type
execute unless score #necro_type overlimit.const matches 1.. run return fail

# Stash onto attacking player
execute as @a[tag=overlimit.necro_attacker,limit=1] run function overlimit:enchant/necromancy/stash_type

# Lethal: Health 0 → spawn here now
execute store result score #hp overlimit.const run data get entity @s Health 10
execute if score #hp overlimit.const matches ..0 as @a[tag=overlimit.necro_attacker,limit=1] run function overlimit:enchant/necromancy/do_spawn
