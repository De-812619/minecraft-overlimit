execute unless entity @s[tag=overlimit.elite] run return fail
tag @s add overlimit.blood_moon
execute if entity @s[tag=overlimit.crisis] run tag @s add overlimit.bm_crisis
execute unless entity @s[tag=overlimit.crisis] run tag @s add overlimit.bm_normal
attribute @s minecraft:follow_range modifier add overlimit:blood_moon_follow 24 add_value
execute on passengers if entity @s[tag=overlimit.elite_xp] run tag @s add overlimit.bm_xp
execute at @s run tag @e[type=minecraft:marker,tag=overlimit.elite_xp,distance=..3] add overlimit.bm_xp
