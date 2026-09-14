execute if entity @a[tag=overlimit.trim.set.emerald,distance=..8] run return fail
attribute @s minecraft:attack_damage modifier remove overlimit:trim.emerald.aura
tag @s remove overlimit.trim.em_aura
