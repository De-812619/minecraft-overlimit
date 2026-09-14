# チャンクが載っていれば門を置く。高さマップの空気待ちはしない。
scoreboard players add @s overlimit.portal_wait 1
execute if score @s overlimit.portal_wait matches 600.. run return run function overlimit:portal/search_stuck
execute unless loaded ~ ~ ~ run function overlimit:portal/forceload_here
execute unless loaded ~ ~ ~ run return fail
execute positioned over world_surface if entity @e[type=minecraft:marker,tag=overlimit.bw_portal,distance=..16] positioned over world_surface run function overlimit:portal/stand_pair
execute positioned over world_surface if entity @e[type=minecraft:marker,tag=overlimit.bw_portal,distance=..16] run return run function overlimit:portal/arrive_done
function overlimit:portal/place_pair
execute positioned over world_surface run function overlimit:portal/stand_pair
execute positioned ~ 64 ~ run function overlimit:portal/stand_pair
return run function overlimit:portal/arrive_done
