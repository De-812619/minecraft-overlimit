execute as @e[type=minecraft:marker,tag=overlimit.bw_portal,distance=..160] at @s positioned ~ ~3 ~ if entity @e[type=minecraft:marker,tag=overlimit.bw_portal,distance=..2] at @s run function overlimit:portal/scrap_here
execute as @e[type=minecraft:marker,tag=overlimit.bw_portal,distance=..160] at @s if function overlimit:portal/is_wet run function overlimit:portal/scrap_here
execute if entity @e[type=minecraft:marker,tag=overlimit.bw_portal,distance=..160] run return run function overlimit:portal/stand_front
execute if function overlimit:portal/find_land run return 1
return fail
