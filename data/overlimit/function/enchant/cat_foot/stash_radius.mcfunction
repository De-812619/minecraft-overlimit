# @s = creeper, first tick in pacify range
execute store result score @s overlimit.creeper_r run data get entity @s Fuse
execute unless score @s overlimit.creeper_r matches 1.. run scoreboard players set @s overlimit.creeper_r 30
attribute @s minecraft:follow_range modifier add overlimit:cat_foot_calm -1.0 add_multiplied_total
