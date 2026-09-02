# チャンクが載っていれば門を置く。高さマップの空気待ちはしない。
execute unless loaded ~ ~ ~ run function overlimit:portal/forceload_here
execute unless loaded ~ ~ ~ run return fail
execute positioned over world_surface if entity @e[type=minecraft:marker,tag=overlimit.bw_portal,distance=..16] positioned over world_surface run function overlimit:portal/stand_pair
execute positioned over world_surface if entity @e[type=minecraft:marker,tag=overlimit.bw_portal,distance=..16] run return run function overlimit:portal/arrive_done
function overlimit:portal/place_pair
execute positioned over world_surface run function overlimit:portal/stand_pair
execute positioned ~ 64 ~ run function overlimit:portal/stand_pair
return run function overlimit:portal/arrive_done
