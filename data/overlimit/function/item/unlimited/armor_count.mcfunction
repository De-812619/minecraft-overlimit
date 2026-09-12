# @s = プレイヤー。王族・魔王の装備数。
scoreboard players set #ul_royal overlimit.const 0
scoreboard players set #ul_demon overlimit.const 0
execute if items entity @s armor.head *[custom_data~{overlimit:{unlimited_royal_helmet:true}}] run scoreboard players add #ul_royal overlimit.const 1
execute if items entity @s armor.chest *[custom_data~{overlimit:{unlimited_royal_chestplate:true}}] run scoreboard players add #ul_royal overlimit.const 1
execute if items entity @s armor.legs *[custom_data~{overlimit:{unlimited_royal_leggings:true}}] run scoreboard players add #ul_royal overlimit.const 1
execute if items entity @s armor.feet *[custom_data~{overlimit:{unlimited_royal_boots:true}}] run scoreboard players add #ul_royal overlimit.const 1
execute if items entity @s armor.head *[custom_data~{overlimit:{unlimited_demon_helmet:true}}] run scoreboard players add #ul_demon overlimit.const 1
execute if items entity @s armor.chest *[custom_data~{overlimit:{unlimited_demon_chestplate:true}}] run scoreboard players add #ul_demon overlimit.const 1
execute if items entity @s armor.legs *[custom_data~{overlimit:{unlimited_demon_leggings:true}}] run scoreboard players add #ul_demon overlimit.const 1
execute if items entity @s armor.feet *[custom_data~{overlimit:{unlimited_demon_boots:true}}] run scoreboard players add #ul_demon overlimit.const 1
