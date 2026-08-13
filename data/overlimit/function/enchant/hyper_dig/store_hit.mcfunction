# 実行位置のブロック座標を pending として保存（視線レイは使わない）
scoreboard players set @s overlimit.hd_ok 1
execute align xyz run summon minecraft:marker ~ ~ ~ {Tags:["overlimit.hd_tmp"]}
execute align xyz store result score @s overlimit.hd_x run data get entity @e[type=minecraft:marker,tag=overlimit.hd_tmp,distance=..0.1,limit=1] Pos[0]
execute align xyz store result score @s overlimit.hd_y run data get entity @e[type=minecraft:marker,tag=overlimit.hd_tmp,distance=..0.1,limit=1] Pos[1]
execute align xyz store result score @s overlimit.hd_z run data get entity @e[type=minecraft:marker,tag=overlimit.hd_tmp,distance=..0.1,limit=1] Pos[2]
execute align xyz run kill @e[type=minecraft:marker,tag=overlimit.hd_tmp,distance=..0.1]
