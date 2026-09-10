# @s = 着弾した UNLIMITED トライデント。忠誠が始まる前の位置を覚える。
tag @s add overlimit.ul.landed
scoreboard players set @s overlimit.ul.stay 80
execute at @s run summon minecraft:marker ~ ~ ~ {Tags:["overlimit.ul.tri_pin","overlimit.ul.tri_pin_new"]}
data modify entity @n[type=minecraft:marker,tag=overlimit.ul.tri_pin_new] Rotation set from entity @s Rotation
scoreboard players operation @n[type=minecraft:marker,tag=overlimit.ul.tri_pin_new] overlimit.ul.sid = @s overlimit.ul.sid
tag @n[type=minecraft:marker,tag=overlimit.ul.tri_pin_new] remove overlimit.ul.tri_pin_new
