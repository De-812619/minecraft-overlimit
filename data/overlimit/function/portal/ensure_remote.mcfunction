# 実行位置に門があれば成功。陸地の総当たりはしない。
execute as @e[type=minecraft:marker,tag=overlimit.bw_portal,distance=..160,limit=6] at @s positioned ~ ~3 ~ if entity @e[type=minecraft:marker,tag=overlimit.bw_portal,distance=..2] at @s run function overlimit:portal/scrap_here
execute if entity @e[type=minecraft:marker,tag=overlimit.bw_portal,distance=..320] if score #bw_no_tp overlimit.const matches 1 run return 1
execute if entity @e[type=minecraft:marker,tag=overlimit.bw_portal,distance=..320] run return run function overlimit:portal/stand_front
return fail
