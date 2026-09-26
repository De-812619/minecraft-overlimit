advancement revoke @s only overlimit:enchant/on_kill

# ソウルテイカー回復は Java PlayerHeal（AFTER_DEATH）。二重回復を避けるためここでは呼ばない。
# メインハンド（SelectedItem / equipment.mainhand）とオフハンドを確認
execute store result score #glut overlimit.const run data get entity @s SelectedItem.components."minecraft:enchantments"."overlimit:gluttony"
execute if score #glut overlimit.const matches 0 store result score #glut overlimit.const run data get entity @s equipment.mainhand.components."minecraft:enchantments"."overlimit:gluttony"

execute store result score #bind overlimit.const run data get entity @s SelectedItem.components."minecraft:enchantments"."overlimit:chain_bind"
execute if score #bind overlimit.const matches 0 store result score #bind overlimit.const run data get entity @s equipment.mainhand.components."minecraft:enchantments"."overlimit:chain_bind"

execute store result score #bind_oh overlimit.const run data get entity @s equipment.offhand.components."minecraft:enchantments"."overlimit:chain_bind"

execute if score #glut overlimit.const matches 1.. run function overlimit:enchant/gluttony/on_kill
execute if score #bind overlimit.const matches 1.. at @s run function overlimit:enchant/chain_bind/on_kill
execute if score #bind_oh overlimit.const matches 1.. unless score #bind overlimit.const matches 1.. at @s run function overlimit:enchant/chain_bind/on_kill

# Necromancy (remembered type from last hit)
execute store result score #necro overlimit.const run data get entity @s SelectedItem.components."minecraft:enchantments"."overlimit:necromancy"
execute if score #necro overlimit.const matches 0 store result score #necro overlimit.const run data get entity @s equipment.mainhand.components."minecraft:enchantments"."overlimit:necromancy"
execute if score #necro overlimit.const matches 1.. at @s run function overlimit:enchant/necromancy/on_kill
