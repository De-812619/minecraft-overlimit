fill ~ ~ ~ ~1 ~2 ~ minecraft:air
kill @e[type=minecraft:marker,tag=overlimit.bw_portal,distance=..3]
kill @e[type=minecraft:block_display,tag=overlimit.bw_vis,distance=..5]
summon minecraft:marker ~0.5 ~ ~0.5 {Tags:["overlimit.bw_portal","overlimit.bw_portal_x"]}
execute if predicate overlimit:in_blood_world as @n[type=minecraft:marker,tag=overlimit.bw_portal,distance=..3] run function overlimit:portal/register_here
function overlimit:portal/vis_x
particle minecraft:crimson_spore ~1 ~1 ~ 0.6 1.2 0.3 0.01 40
