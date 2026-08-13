# @s = attacking player. Source mob tagged overlimit.necro_src
tag @s add overlimit.necro_owner
function overlimit:enchant/necromancy/assign_owner_id

scoreboard players set #summons overlimit.const 0
execute as @e[tag=overlimit.summon_wolf] on owner if entity @s[tag=overlimit.necro_owner] run scoreboard players add #summons overlimit.const 1
execute as @e[tag=overlimit.necro] if score @s overlimit.necro_owner = @a[tag=overlimit.necro_owner,limit=1] overlimit.necro_owner run scoreboard players add #summons overlimit.const 1
execute if score #summons overlimit.const matches 10.. run tag @s remove overlimit.necro_owner
execute if score #summons overlimit.const matches 10.. run return fail

execute at @n[tag=overlimit.necro_src] as @n[tag=overlimit.necro_src] run function overlimit:enchant/necromancy/spawn_copy
tag @s remove overlimit.necro_owner
