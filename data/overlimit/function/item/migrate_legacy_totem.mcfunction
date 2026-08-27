advancement revoke @s only overlimit:item/legacy_totem_base
execute store result score #m overlimit.const run clear @s minecraft:totem_of_undying[custom_data~{overlimit:{phoenix_amulet:true}}] 1
execute if score #m overlimit.const matches 1 run loot give @s loot overlimit:phoenix_amulet
execute if score #m overlimit.const matches 1 run return run function overlimit:item/migrate_legacy_totem
execute store result score #m overlimit.const run clear @s minecraft:totem_of_undying[custom_data~{overlimit:{quiet_totem:true}}] 1
execute if score #m overlimit.const matches 1 run loot give @s loot overlimit:quiet_totem
execute if score #m overlimit.const matches 1 run return run function overlimit:item/migrate_legacy_totem
execute store result score #m overlimit.const run clear @s minecraft:totem_of_undying[custom_data~{overlimit:{quiet_totem_spent:true}}] 1
execute if score #m overlimit.const matches 1 run loot give @s loot overlimit:quiet_totem
