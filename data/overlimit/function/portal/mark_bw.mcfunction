# いま着いたブラッドワールドの門を、次の入場先にする。
scoreboard players set @s overlimit.bw_has 1
execute store result score @s overlimit.bwx run data get entity @s Pos[0]
execute store result score @s overlimit.bwy run data get entity @s Pos[1]
execute store result score @s overlimit.bwz run data get entity @s Pos[2]
execute at @s as @n[type=minecraft:marker,tag=overlimit.bw_portal,distance=..8] store result score #gate_x overlimit.const run data get entity @s Pos[0]
execute at @s as @n[type=minecraft:marker,tag=overlimit.bw_portal,distance=..8] store result score #gate_y overlimit.const run data get entity @s Pos[1]
execute at @s as @n[type=minecraft:marker,tag=overlimit.bw_portal,distance=..8] store result score #gate_z overlimit.const run data get entity @s Pos[2]
execute at @s if entity @n[type=minecraft:marker,tag=overlimit.bw_portal,distance=..8] run scoreboard players operation @s overlimit.bwx = #gate_x overlimit.const
execute at @s if entity @n[type=minecraft:marker,tag=overlimit.bw_portal,distance=..8] run scoreboard players operation @s overlimit.bwy = #gate_y overlimit.const
execute at @s if entity @n[type=minecraft:marker,tag=overlimit.bw_portal,distance=..8] run scoreboard players operation @s overlimit.bwz = #gate_z overlimit.const
