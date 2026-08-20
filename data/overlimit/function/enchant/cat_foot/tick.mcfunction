# @s = wearer. Nearby creepers lose aggro and never finish a fuse.
execute as @e[type=minecraft:creeper,tag=!overlimit.summon,distance=..16] run function overlimit:enchant/cat_foot/pacify
