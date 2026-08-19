# 金床後（repair_cost が 1 以上）の上限超えバニラエンチャントを max_level へ戻す
# *[minecraft:repair_cost] は 0（デフォルト）にも当たるので、値を読んで 1.. だけ対象にする

execute store result score #rc overlimit.const run data get entity @s Inventory[{Slot:0b}].components."minecraft:repair_cost"
execute if score #rc overlimit.const matches 1.. run item modify entity @s container.0 overlimit:cap_vanilla_levels
execute store result score #rc overlimit.const run data get entity @s Inventory[{Slot:1b}].components."minecraft:repair_cost"
execute if score #rc overlimit.const matches 1.. run item modify entity @s container.1 overlimit:cap_vanilla_levels
execute store result score #rc overlimit.const run data get entity @s Inventory[{Slot:2b}].components."minecraft:repair_cost"
execute if score #rc overlimit.const matches 1.. run item modify entity @s container.2 overlimit:cap_vanilla_levels
execute store result score #rc overlimit.const run data get entity @s Inventory[{Slot:3b}].components."minecraft:repair_cost"
execute if score #rc overlimit.const matches 1.. run item modify entity @s container.3 overlimit:cap_vanilla_levels
execute store result score #rc overlimit.const run data get entity @s Inventory[{Slot:4b}].components."minecraft:repair_cost"
execute if score #rc overlimit.const matches 1.. run item modify entity @s container.4 overlimit:cap_vanilla_levels
execute store result score #rc overlimit.const run data get entity @s Inventory[{Slot:5b}].components."minecraft:repair_cost"
execute if score #rc overlimit.const matches 1.. run item modify entity @s container.5 overlimit:cap_vanilla_levels
execute store result score #rc overlimit.const run data get entity @s Inventory[{Slot:6b}].components."minecraft:repair_cost"
execute if score #rc overlimit.const matches 1.. run item modify entity @s container.6 overlimit:cap_vanilla_levels
execute store result score #rc overlimit.const run data get entity @s Inventory[{Slot:7b}].components."minecraft:repair_cost"
execute if score #rc overlimit.const matches 1.. run item modify entity @s container.7 overlimit:cap_vanilla_levels
execute store result score #rc overlimit.const run data get entity @s Inventory[{Slot:8b}].components."minecraft:repair_cost"
execute if score #rc overlimit.const matches 1.. run item modify entity @s container.8 overlimit:cap_vanilla_levels
execute store result score #rc overlimit.const run data get entity @s Inventory[{Slot:9b}].components."minecraft:repair_cost"
execute if score #rc overlimit.const matches 1.. run item modify entity @s container.9 overlimit:cap_vanilla_levels
execute store result score #rc overlimit.const run data get entity @s Inventory[{Slot:10b}].components."minecraft:repair_cost"
execute if score #rc overlimit.const matches 1.. run item modify entity @s container.10 overlimit:cap_vanilla_levels
execute store result score #rc overlimit.const run data get entity @s Inventory[{Slot:11b}].components."minecraft:repair_cost"
execute if score #rc overlimit.const matches 1.. run item modify entity @s container.11 overlimit:cap_vanilla_levels
execute store result score #rc overlimit.const run data get entity @s Inventory[{Slot:12b}].components."minecraft:repair_cost"
execute if score #rc overlimit.const matches 1.. run item modify entity @s container.12 overlimit:cap_vanilla_levels
execute store result score #rc overlimit.const run data get entity @s Inventory[{Slot:13b}].components."minecraft:repair_cost"
execute if score #rc overlimit.const matches 1.. run item modify entity @s container.13 overlimit:cap_vanilla_levels
execute store result score #rc overlimit.const run data get entity @s Inventory[{Slot:14b}].components."minecraft:repair_cost"
execute if score #rc overlimit.const matches 1.. run item modify entity @s container.14 overlimit:cap_vanilla_levels
execute store result score #rc overlimit.const run data get entity @s Inventory[{Slot:15b}].components."minecraft:repair_cost"
execute if score #rc overlimit.const matches 1.. run item modify entity @s container.15 overlimit:cap_vanilla_levels
execute store result score #rc overlimit.const run data get entity @s Inventory[{Slot:16b}].components."minecraft:repair_cost"
execute if score #rc overlimit.const matches 1.. run item modify entity @s container.16 overlimit:cap_vanilla_levels
execute store result score #rc overlimit.const run data get entity @s Inventory[{Slot:17b}].components."minecraft:repair_cost"
execute if score #rc overlimit.const matches 1.. run item modify entity @s container.17 overlimit:cap_vanilla_levels
execute store result score #rc overlimit.const run data get entity @s Inventory[{Slot:18b}].components."minecraft:repair_cost"
execute if score #rc overlimit.const matches 1.. run item modify entity @s container.18 overlimit:cap_vanilla_levels
execute store result score #rc overlimit.const run data get entity @s Inventory[{Slot:19b}].components."minecraft:repair_cost"
execute if score #rc overlimit.const matches 1.. run item modify entity @s container.19 overlimit:cap_vanilla_levels
execute store result score #rc overlimit.const run data get entity @s Inventory[{Slot:20b}].components."minecraft:repair_cost"
execute if score #rc overlimit.const matches 1.. run item modify entity @s container.20 overlimit:cap_vanilla_levels
execute store result score #rc overlimit.const run data get entity @s Inventory[{Slot:21b}].components."minecraft:repair_cost"
execute if score #rc overlimit.const matches 1.. run item modify entity @s container.21 overlimit:cap_vanilla_levels
execute store result score #rc overlimit.const run data get entity @s Inventory[{Slot:22b}].components."minecraft:repair_cost"
execute if score #rc overlimit.const matches 1.. run item modify entity @s container.22 overlimit:cap_vanilla_levels
execute store result score #rc overlimit.const run data get entity @s Inventory[{Slot:23b}].components."minecraft:repair_cost"
execute if score #rc overlimit.const matches 1.. run item modify entity @s container.23 overlimit:cap_vanilla_levels
execute store result score #rc overlimit.const run data get entity @s Inventory[{Slot:24b}].components."minecraft:repair_cost"
execute if score #rc overlimit.const matches 1.. run item modify entity @s container.24 overlimit:cap_vanilla_levels
execute store result score #rc overlimit.const run data get entity @s Inventory[{Slot:25b}].components."minecraft:repair_cost"
execute if score #rc overlimit.const matches 1.. run item modify entity @s container.25 overlimit:cap_vanilla_levels
execute store result score #rc overlimit.const run data get entity @s Inventory[{Slot:26b}].components."minecraft:repair_cost"
execute if score #rc overlimit.const matches 1.. run item modify entity @s container.26 overlimit:cap_vanilla_levels
execute store result score #rc overlimit.const run data get entity @s Inventory[{Slot:27b}].components."minecraft:repair_cost"
execute if score #rc overlimit.const matches 1.. run item modify entity @s container.27 overlimit:cap_vanilla_levels
execute store result score #rc overlimit.const run data get entity @s Inventory[{Slot:28b}].components."minecraft:repair_cost"
execute if score #rc overlimit.const matches 1.. run item modify entity @s container.28 overlimit:cap_vanilla_levels
execute store result score #rc overlimit.const run data get entity @s Inventory[{Slot:29b}].components."minecraft:repair_cost"
execute if score #rc overlimit.const matches 1.. run item modify entity @s container.29 overlimit:cap_vanilla_levels
execute store result score #rc overlimit.const run data get entity @s Inventory[{Slot:30b}].components."minecraft:repair_cost"
execute if score #rc overlimit.const matches 1.. run item modify entity @s container.30 overlimit:cap_vanilla_levels
execute store result score #rc overlimit.const run data get entity @s Inventory[{Slot:31b}].components."minecraft:repair_cost"
execute if score #rc overlimit.const matches 1.. run item modify entity @s container.31 overlimit:cap_vanilla_levels
execute store result score #rc overlimit.const run data get entity @s Inventory[{Slot:32b}].components."minecraft:repair_cost"
execute if score #rc overlimit.const matches 1.. run item modify entity @s container.32 overlimit:cap_vanilla_levels
execute store result score #rc overlimit.const run data get entity @s Inventory[{Slot:33b}].components."minecraft:repair_cost"
execute if score #rc overlimit.const matches 1.. run item modify entity @s container.33 overlimit:cap_vanilla_levels
execute store result score #rc overlimit.const run data get entity @s Inventory[{Slot:34b}].components."minecraft:repair_cost"
execute if score #rc overlimit.const matches 1.. run item modify entity @s container.34 overlimit:cap_vanilla_levels
execute store result score #rc overlimit.const run data get entity @s Inventory[{Slot:35b}].components."minecraft:repair_cost"
execute if score #rc overlimit.const matches 1.. run item modify entity @s container.35 overlimit:cap_vanilla_levels
execute store result score #rc overlimit.const run data get entity @s equipment.head.components."minecraft:repair_cost"
execute if score #rc overlimit.const matches 1.. run item modify entity @s armor.head overlimit:cap_vanilla_levels
execute store result score #rc overlimit.const run data get entity @s equipment.chest.components."minecraft:repair_cost"
execute if score #rc overlimit.const matches 1.. run item modify entity @s armor.chest overlimit:cap_vanilla_levels
execute store result score #rc overlimit.const run data get entity @s equipment.legs.components."minecraft:repair_cost"
execute if score #rc overlimit.const matches 1.. run item modify entity @s armor.legs overlimit:cap_vanilla_levels
execute store result score #rc overlimit.const run data get entity @s equipment.feet.components."minecraft:repair_cost"
execute if score #rc overlimit.const matches 1.. run item modify entity @s armor.feet overlimit:cap_vanilla_levels
execute store result score #rc overlimit.const run data get entity @s equipment.offhand.components."minecraft:repair_cost"
execute if score #rc overlimit.const matches 1.. run item modify entity @s weapon.offhand overlimit:cap_vanilla_levels
