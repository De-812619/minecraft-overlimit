execute unless entity @s[tag=overlimit.elite] run return fail
tag @s add overlimit.blood_moon
attribute @s minecraft:follow_range modifier add overlimit:blood_moon_follow 24 add_value
