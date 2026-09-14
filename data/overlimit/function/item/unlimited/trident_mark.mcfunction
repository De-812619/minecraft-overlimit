tag @s add overlimit.ul.tri_chk
execute if data entity @s item.components."minecraft:custom_data".overlimit.unlimited_trident run tag @s add overlimit.ul.tri
execute if data entity @s weapon.components."minecraft:custom_data".overlimit.unlimited_trident run tag @s add overlimit.ul.tri
execute if entity @s[tag=overlimit.ul.tri] run function overlimit:item/unlimited/trident_speed
