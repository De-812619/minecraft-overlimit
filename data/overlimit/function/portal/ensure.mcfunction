# 積み上がった門は消す。水際の撤去と陸地探しはブラッドワールド到着だけ（帰りの OW 門は残す）。
execute as @e[type=minecraft:marker,tag=overlimit.bw_portal,distance=..160] at @s positioned ~ ~3 ~ if entity @e[type=minecraft:marker,tag=overlimit.bw_portal,distance=..2] at @s run function overlimit:portal/scrap_here
execute if predicate overlimit:in_blood_world as @e[type=minecraft:marker,tag=overlimit.bw_portal,distance=..160] at @s if function overlimit:portal/is_wet run function overlimit:portal/scrap_here
execute if entity @e[type=minecraft:marker,tag=overlimit.bw_portal,distance=..160] run return run function overlimit:portal/stand_front
execute if predicate overlimit:in_overworld run return fail
execute if function overlimit:portal/find_land run return 1
return fail
