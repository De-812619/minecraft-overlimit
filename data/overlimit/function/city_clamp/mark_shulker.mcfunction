tag @s remove overlimit.cc_new
function overlimit:mob/make_danger
data merge entity @s {drop_chances:{head:0.0f,mainhand:0.0f}}
attribute @s minecraft:follow_range modifier add overlimit:cc_follow 24 add_value
tag @s add overlimit.scanned
function overlimit:city_clamp/anger
function overlimit:city_clamp/glow
