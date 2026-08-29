$execute in overlimit:blood_world positioned $(x) $(y) $(z) as @e[type=minecraft:marker,tag=overlimit.bw_portal,distance=..12] at @s run function overlimit:portal/scrap_here
$execute in overlimit:blood_world positioned $(x) 64 $(z) as @e[type=minecraft:marker,tag=overlimit.bw_portal,distance=..320] at @s run function overlimit:portal/scrap_here
$execute in overlimit:blood_world positioned $(x) $(y) $(z) align xyz run function overlimit:portal/scrap_x
$execute in overlimit:blood_world positioned $(x) $(y) $(z) align xyz run function overlimit:portal/scrap_z
$execute in overlimit:blood_world positioned $(x) 64 $(z) positioned over motion_blocking_no_leaves align xyz run function overlimit:portal/scrap_x
$execute in overlimit:blood_world positioned $(x) 64 $(z) positioned over motion_blocking_no_leaves align xyz run function overlimit:portal/scrap_z
$execute in overlimit:blood_world positioned $(x) $(y) $(z) run kill @e[type=minecraft:block_display,tag=overlimit.bw_vis,distance=..12]
