# @s = creeper, first tick in pacify range
function overlimit:enchant/cat_foot/stash_radius
data modify entity @s ignited set value 0b
data modify entity @s Fuse set value 32767s
tag @s add overlimit.cat_pacify
