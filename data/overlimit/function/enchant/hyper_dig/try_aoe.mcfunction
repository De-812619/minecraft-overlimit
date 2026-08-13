# pending（hit_block で記録した破壊対象）が空気なら、そこを中心に 3×3×3
execute if entity @s[tag=overlimit.hyper_digging] run return fail

execute store result score #hd overlimit.const run data get entity @s SelectedItem.components."minecraft:enchantments"."overlimit:hyper_dig"
execute if score #hd overlimit.const matches 0 store result score #hd overlimit.const run data get entity @s equipment.mainhand.components."minecraft:enchantments"."overlimit:hyper_dig"
execute unless score #hd overlimit.const matches 1.. run return fail
execute unless score @s overlimit.hd_ok matches 1 run return fail

tag @s add overlimit.hyper_digging
scoreboard players set #hd_broke overlimit.const 0
function overlimit:enchant/hyper_dig/try_pos_cur
execute if score #hd_broke overlimit.const matches 1 run scoreboard players set @s overlimit.hd_ok 0
tag @s remove overlimit.hyper_digging
