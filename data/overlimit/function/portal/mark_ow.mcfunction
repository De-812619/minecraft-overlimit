# いま入ったオーバーワールドの門を帰り先にする。
scoreboard players set @s overlimit.ow_has 1
execute store result score @s overlimit.owx run data get entity @s Pos[0]
execute store result score @s overlimit.owy run data get entity @s Pos[1]
execute store result score @s overlimit.owz run data get entity @s Pos[2]
execute at @s as @n[type=minecraft:marker,tag=overlimit.bw_portal,distance=..8] store result score #gate_x overlimit.const run data get entity @s Pos[0]
execute at @s as @n[type=minecraft:marker,tag=overlimit.bw_portal,distance=..8] store result score #gate_y overlimit.const run data get entity @s Pos[1]
execute at @s as @n[type=minecraft:marker,tag=overlimit.bw_portal,distance=..8] store result score #gate_z overlimit.const run data get entity @s Pos[2]
execute at @s if entity @n[type=minecraft:marker,tag=overlimit.bw_portal,distance=..8] run scoreboard players operation @s overlimit.owx = #gate_x overlimit.const
execute at @s if entity @n[type=minecraft:marker,tag=overlimit.bw_portal,distance=..8] run scoreboard players operation @s overlimit.owy = #gate_y overlimit.const
execute at @s if entity @n[type=minecraft:marker,tag=overlimit.bw_portal,distance=..8] run scoreboard players operation @s overlimit.owz = #gate_z overlimit.const
