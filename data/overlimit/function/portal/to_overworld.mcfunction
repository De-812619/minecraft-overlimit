# 帰り先未登録。今の BW 門（または足元）を /8 して OW へ。
tag @s add overlimit.portal_arrive
scoreboard players set @s overlimit.portal_wait 0
execute store result score @s overlimit.owx run data get entity @s Pos[0]
execute store result score @s overlimit.owy run data get entity @s Pos[1]
execute store result score @s overlimit.owz run data get entity @s Pos[2]
execute at @s as @n[type=minecraft:marker,tag=overlimit.bw_portal,distance=..8] store result score #gate_x overlimit.const run data get entity @s Pos[0]
execute at @s as @n[type=minecraft:marker,tag=overlimit.bw_portal,distance=..8] store result score #gate_y overlimit.const run data get entity @s Pos[1]
execute at @s as @n[type=minecraft:marker,tag=overlimit.bw_portal,distance=..8] store result score #gate_z overlimit.const run data get entity @s Pos[2]
execute at @s if entity @n[type=minecraft:marker,tag=overlimit.bw_portal,distance=..8] run scoreboard players operation @s overlimit.owx = #gate_x overlimit.const
execute at @s if entity @n[type=minecraft:marker,tag=overlimit.bw_portal,distance=..8] run scoreboard players operation @s overlimit.owy = #gate_y overlimit.const
execute at @s if entity @n[type=minecraft:marker,tag=overlimit.bw_portal,distance=..8] run scoreboard players operation @s overlimit.owz = #gate_z overlimit.const
scoreboard players operation @s overlimit.owx /= #bw_scale overlimit.const
scoreboard players operation @s overlimit.owz /= #bw_scale overlimit.const
scoreboard players set @s overlimit.ow_has 1
execute store result storage overlimit:portal tp.x int 1 run scoreboard players get @s overlimit.owx
execute store result storage overlimit:portal tp.y int 1 run scoreboard players get @s overlimit.owy
execute store result storage overlimit:portal tp.z int 1 run scoreboard players get @s overlimit.owz
data modify storage overlimit:portal tp.dim set value "minecraft:overworld"
function overlimit:portal/tp_to with storage overlimit:portal tp
schedule function overlimit:portal/arrive 1t replace
