# @s = pacified creeper. Restore when no wearer is nearby.
execute as @a[distance=..20] if data entity @s equipment.feet.components."minecraft:enchantments"."overlimit:cat_foot" run return fail
execute unless score @s overlimit.creeper_r matches 1.. run scoreboard players set @s overlimit.creeper_r 30
execute store result entity @s Fuse short 1 run scoreboard players get @s overlimit.creeper_r
data modify entity @s ignited set value 0b
data modify entity @s NoAI set value 0b
attribute @s minecraft:follow_range modifier remove overlimit:cat_foot_calm
tag @s remove overlimit.cat_pacify
scoreboard players reset @s overlimit.creeper_r
