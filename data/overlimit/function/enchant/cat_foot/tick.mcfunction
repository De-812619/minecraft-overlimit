# @s = wearer. Nearby creepers lose aggro and never finish a fuse.
execute at @s run function overlimit:enchant/cat_foot/strip_old_jump
execute at @s run function overlimit:enchant/cat_foot/sync_jump
execute at @s run function overlimit:enchant/cat_foot/strip_old_jump
execute as @e[type=minecraft:creeper,tag=!overlimit.summon,distance=..16] run function overlimit:enchant/cat_foot/pacify
