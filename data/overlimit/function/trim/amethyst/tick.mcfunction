effect clear @s minecraft:darkness
effect clear @s minecraft:blindness
execute if predicate overlimit:trim/dark run function overlimit:trim/amethyst/apply_nv
execute unless predicate overlimit:trim/dark if entity @s[tag=overlimit.trim.amy_nv] run function overlimit:trim/amethyst/clear_nv
