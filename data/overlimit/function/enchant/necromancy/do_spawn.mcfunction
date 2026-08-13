# @s = owning player. Position = spawn location.
execute if score @s overlimit.necro_cd matches 1.. run return fail

execute store result score #necro overlimit.const run data get entity @s SelectedItem.components."minecraft:enchantments"."overlimit:necromancy"
execute if score #necro overlimit.const matches 0 store result score #necro overlimit.const run data get entity @s equipment.mainhand.components."minecraft:enchantments"."overlimit:necromancy"
execute unless score #necro overlimit.const matches 1.. run return fail
execute unless score @s overlimit.necro_type matches 1.. run return fail

tag @s add overlimit.necro_owner
function overlimit:enchant/necromancy/assign_owner_id

scoreboard players set #summons overlimit.const 0
execute as @e[tag=overlimit.summon_wolf] on owner if entity @s[tag=overlimit.necro_owner] run scoreboard players add #summons overlimit.const 1
execute as @e[tag=overlimit.necro] if score @s overlimit.necro_owner = @a[tag=overlimit.necro_owner,limit=1] overlimit.necro_owner run scoreboard players add #summons overlimit.const 1
execute if score #summons overlimit.const matches 10.. run tag @s remove overlimit.necro_owner
execute if score #summons overlimit.const matches 10.. run return fail

scoreboard players operation #necro_type overlimit.const = @s overlimit.necro_type
function overlimit:enchant/necromancy/spawn_by_type
scoreboard players set @s overlimit.necro_pending 0
scoreboard players set @s overlimit.necro_cd 10
scoreboard players operation @s overlimit.mob_prev = @s overlimit.mob_kills
tag @s remove overlimit.necro_owner
