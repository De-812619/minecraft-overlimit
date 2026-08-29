advancement revoke @s only overlimit:item/legacy_potato_base
execute store result score #m overlimit.const run clear @s minecraft:poisonous_potato[custom_data~{overlimit:{quiet_totem:true}}] 1
execute if score #m overlimit.const matches 1 run loot give @s loot overlimit:quiet_totem
execute if score #m overlimit.const matches 1 run return run function overlimit:item/migrate_legacy_potato
execute store result score #m overlimit.const run clear @s minecraft:poisonous_potato[custom_data~{overlimit:{quiet_totem_spent:true}}] 1
execute if score #m overlimit.const matches 1 run loot give @s loot overlimit:quiet_totem
execute if score #m overlimit.const matches 1 run return run function overlimit:item/migrate_legacy_potato
execute store result score #m overlimit.const run clear @s minecraft:poisonous_potato[custom_data~{overlimit:{holy_totem:true}}] 1
execute if score #m overlimit.const matches 1 run loot give @s loot overlimit:holy_totem
execute if score #m overlimit.const matches 1 run return run function overlimit:item/migrate_legacy_potato
execute store result score #m overlimit.const run clear @s minecraft:poisonous_potato[custom_data~{overlimit:{holy_totem_spent:true}}] 1
execute if score #m overlimit.const matches 1 run loot give @s loot overlimit:holy_totem
