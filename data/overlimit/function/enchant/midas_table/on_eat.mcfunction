advancement revoke @s only overlimit:enchant/midas_table_eat

execute store result score #midas overlimit.const run data get entity @s equipment.head.components."minecraft:enchantments"."overlimit:midas_table"
execute if score #midas overlimit.const matches 1.. at @s run function overlimit:enchant/midas_table/apply
