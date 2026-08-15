# 耐久力が不発でも、pending が空気になった tick で 3×3 する
execute store result score #hd overlimit.const run data get entity @s SelectedItem.components."minecraft:enchantments"."overlimit:hyper_dig"
execute if score #hd overlimit.const matches 0 store result score #hd overlimit.const run data get entity @s equipment.mainhand.components."minecraft:enchantments"."overlimit:hyper_dig"
execute unless score #hd overlimit.const matches 1.. run scoreboard players set @s overlimit.hd_ok 0
execute unless score #hd overlimit.const matches 1.. run scoreboard players set @s overlimit.hd_pok 0
execute unless score #hd overlimit.const matches 1.. run scoreboard players set @s overlimit.hd_prev_life 0
execute unless score #hd overlimit.const matches 1.. run return fail
function overlimit:enchant/hyper_dig/try_aoe
execute if score @s overlimit.hd_prev_life matches 1.. run scoreboard players remove @s overlimit.hd_prev_life 1
execute unless score @s overlimit.hd_prev_life matches 1.. run scoreboard players set @s overlimit.hd_pok 0
