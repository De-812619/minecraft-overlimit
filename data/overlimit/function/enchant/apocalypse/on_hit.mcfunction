# @s = attack victim (center). AoE fire + knockback on hostiles in r=3 (no players).
tag @s add overlimit.kb_center
execute as @e[type=#overlimit:hostile,distance=..3,tag=!overlimit.kb_center] at @s run function overlimit:enchant/apocalypse/affect
tag @s remove overlimit.kb_center
particle minecraft:flame ~ ~1 ~ 1.2 0.4 1.2 0.02 30
