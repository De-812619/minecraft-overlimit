execute unless score @s overlimit.cat_boost matches 1 run return fail
attribute @s minecraft:jump_strength modifier remove overlimit:cat_foot_jump
effect clear @s minecraft:jump_boost
scoreboard players set @s overlimit.cat_boost 0
