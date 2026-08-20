# @s = creeper, execution position = wearer.
execute unless entity @s[tag=overlimit.cat_pacify] run function overlimit:enchant/cat_foot/stash_radius
data modify entity @s ignited set value 0b
data modify entity @s Fuse set value 32767s
tag @s add overlimit.cat_pacify

# SwellGoal starts inside 3 blocks. Freeze first so the fuse never begins.
execute if entity @s[distance=..6] run data modify entity @s NoAI set value 1b
execute unless entity @s[distance=..6] run data modify entity @s NoAI set value 0b
