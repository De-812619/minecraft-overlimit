# 積み上がった門は消す。到着中の陸地総当たりはしない。
execute as @e[type=minecraft:marker,tag=overlimit.bw_portal,distance=..160,limit=6] at @s positioned ~ ~3 ~ if entity @e[type=minecraft:marker,tag=overlimit.bw_portal,distance=..2] at @s run function overlimit:portal/scrap_here
execute if entity @e[type=minecraft:marker,tag=overlimit.bw_portal,distance=..48] run return run function overlimit:portal/stand_front
return fail
