tag @s add overlimit.trim.hit_src
function overlimit:trim/count
function overlimit:trim/sets
execute if entity @s[tag=overlimit.trim.set.copper] run function overlimit:trim/copper/on_melee
execute if entity @s[tag=overlimit.trim.set.quartz] run function overlimit:trim/quartz/on_melee
tag @s remove overlimit.trim.hit_src
