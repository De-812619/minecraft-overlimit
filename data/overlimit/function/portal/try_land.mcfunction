execute unless loaded ~ ~ ~ run forceload add ~ ~ ~ ~
execute unless loaded ~ ~ ~ run return fail
execute if function overlimit:portal/is_wet run return fail
execute positioned over motion_blocking_no_leaves if block ~ ~ ~ minecraft:crying_obsidian run return fail
execute if entity @e[type=minecraft:marker,tag=overlimit.bw_portal,distance=..8] run return run function overlimit:portal/stand_front
execute positioned over motion_blocking_no_leaves positioned ~ ~1 ~ if block ~ ~ ~ #minecraft:leaves run return fail
execute positioned over motion_blocking_no_leaves positioned ~ ~1 ~ if block ~ ~ ~ #minecraft:logs run return fail
execute positioned over motion_blocking_no_leaves positioned ~ ~1 ~ align xyz run function overlimit:portal/build_x
execute positioned over motion_blocking_no_leaves positioned ~ ~1 ~ align xyz run function overlimit:portal/stand_front
return 1
