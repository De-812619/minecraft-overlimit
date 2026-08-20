# いま着いたブラッドワールドの門を、このセッションの合流先にする。
scoreboard players set #bw_gate overlimit.const 1
scoreboard players set #bw_pending overlimit.const 0
scoreboard players set #bw_sess overlimit.const 1
execute store result score #bw_sess_x overlimit.const run data get entity @s Pos[0]
execute store result score #bw_sess_y overlimit.const run data get entity @s Pos[1]
execute store result score #bw_sess_z overlimit.const run data get entity @s Pos[2]
execute at @s as @n[type=minecraft:marker,tag=overlimit.bw_portal,distance=..8] store result score #gate_x overlimit.const run data get entity @s Pos[0]
execute at @s as @n[type=minecraft:marker,tag=overlimit.bw_portal,distance=..8] store result score #gate_y overlimit.const run data get entity @s Pos[1]
execute at @s as @n[type=minecraft:marker,tag=overlimit.bw_portal,distance=..8] store result score #gate_z overlimit.const run data get entity @s Pos[2]
execute at @s if entity @n[type=minecraft:marker,tag=overlimit.bw_portal,distance=..8] run scoreboard players operation #bw_sess_x overlimit.const = #gate_x overlimit.const
execute at @s if entity @n[type=minecraft:marker,tag=overlimit.bw_portal,distance=..8] run scoreboard players operation #bw_sess_y overlimit.const = #gate_y overlimit.const
execute at @s if entity @n[type=minecraft:marker,tag=overlimit.bw_portal,distance=..8] run scoreboard players operation #bw_sess_z overlimit.const = #gate_z overlimit.const
