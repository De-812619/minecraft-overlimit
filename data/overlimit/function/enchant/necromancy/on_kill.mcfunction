# Kill backup: spawn from stashed type, or from a nearby Health0 corpse.
execute if score @s overlimit.necro_cd matches 1.. run return fail

execute store result score #necro overlimit.const run data get entity @s SelectedItem.components."minecraft:enchantments"."overlimit:necromancy"
execute if score #necro overlimit.const matches 0 store result score #necro overlimit.const run data get entity @s equipment.mainhand.components."minecraft:enchantments"."overlimit:necromancy"
execute unless score #necro overlimit.const matches 1.. run return fail

execute if score @s overlimit.necro_pending matches 1.. if score @s overlimit.necro_type matches 1.. at @s run return run function overlimit:enchant/necromancy/do_spawn

# Corpse fallback
scoreboard players set #necro_type overlimit.const 0
execute as @e[type=#overlimit:can_be_danger,tag=!overlimit.summon,tag=!overlimit.elite,tag=!overlimit.necro,distance=..12] at @s run function overlimit:enchant/necromancy/try_encode_dead
execute unless score #necro_type overlimit.const matches 1.. run return fail
scoreboard players operation @s overlimit.necro_type = #necro_type overlimit.const
execute at @s run function overlimit:enchant/necromancy/do_spawn
