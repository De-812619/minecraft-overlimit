# 実行位置付近の門をセッション合流先にする。プレイヤーは動かさない。
# distance は 3D。測量点 Y=64 と山頂の門の高低差を拾う。
execute unless entity @e[type=minecraft:marker,tag=overlimit.bw_portal,distance=..320] run return fail
scoreboard players set #bw_gate overlimit.const 1
scoreboard players set #bw_pending overlimit.const 0
scoreboard players set #bw_sess overlimit.const 1
execute as @n[type=minecraft:marker,tag=overlimit.bw_portal,distance=..320] store result score #bw_sess_x overlimit.const run data get entity @s Pos[0]
execute as @n[type=minecraft:marker,tag=overlimit.bw_portal,distance=..320] store result score #bw_sess_y overlimit.const run data get entity @s Pos[1]
execute as @n[type=minecraft:marker,tag=overlimit.bw_portal,distance=..320] store result score #bw_sess_z overlimit.const run data get entity @s Pos[2]
execute if score #bw_warm overlimit.const matches 1 run function overlimit:portal/warm_hold
return 1
