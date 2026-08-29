execute positioned over motion_blocking_no_leaves positioned ~ ~1 ~ align xyz if function overlimit:portal/find_land run return run function overlimit:portal/placed
execute if entity @e[type=minecraft:marker,tag=overlimit.bw_portal,distance=..48] run function overlimit:portal/stand_front
execute if entity @e[type=minecraft:marker,tag=overlimit.bw_portal,distance=..48] run return run function overlimit:portal/arrive_done
return fail
execute if entity @e[type=minecraft:marker,tag=overlimit.bw_portal,distance=..48] run function overlimit:portal/stand_front
execute if entity @e[type=minecraft:marker,tag=overlimit.bw_portal,distance=..48] run return run function overlimit:portal/arrive_done
return fail
