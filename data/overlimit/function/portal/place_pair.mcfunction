# この XZ に対になる門が無ければ、今の列に置く。海・溶岩・空気なら足場。
execute positioned over world_surface if entity @e[type=minecraft:marker,tag=overlimit.bw_portal,distance=..16] run return 1
execute positioned over world_surface if function overlimit:portal/wet_at run return run function overlimit:portal/place_platform
execute positioned over motion_blocking_no_leaves if block ~ ~ ~ minecraft:air run return run function overlimit:portal/place_platform_air
execute positioned over motion_blocking_no_leaves if block ~ ~ ~ minecraft:cave_air run return run function overlimit:portal/place_platform_air
execute positioned over motion_blocking_no_leaves positioned ~ ~1 ~ align xyz run function overlimit:portal/build_x
return 1
