tag @s remove overlimit.cc_new
data merge entity @s {CanPickUpLoot:0b}
function overlimit:city_clamp/pick_rank
data merge entity @s {drop_chances:{head:0.0f,mainhand:0.0f}}
attribute @s minecraft:follow_range modifier add overlimit:cc_follow 24 add_value
tag @s add overlimit.scanned
function overlimit:city_clamp/anger
function overlimit:city_clamp/glow
