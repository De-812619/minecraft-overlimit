# 対になる門の手前。遠くの別門には寄せない。
execute if entity @e[type=minecraft:marker,tag=overlimit.bw_portal_x,distance=..16] at @n[type=minecraft:marker,tag=overlimit.bw_portal_x,distance=..16] positioned ~ ~ ~-2.5 run return run tp @s ~ ~ ~
execute if entity @e[type=minecraft:marker,tag=overlimit.bw_portal_z,distance=..16] at @n[type=minecraft:marker,tag=overlimit.bw_portal_z,distance=..16] positioned ~-2.5 ~ ~ run return run tp @s ~ ~ ~
execute at @n[type=minecraft:marker,tag=overlimit.bw_portal,distance=..16] positioned ~-2.5 ~ ~ run tp @s ~ ~ ~
