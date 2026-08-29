execute store result storage overlimit:portal tp.x int 1 run scoreboard players get #bw_sess_x overlimit.const
execute store result storage overlimit:portal tp.y int 1 run scoreboard players get #bw_sess_y overlimit.const
execute store result storage overlimit:portal tp.z int 1 run scoreboard players get #bw_sess_z overlimit.const
data modify storage overlimit:portal tp.dim set value "overlimit:blood_world"
function overlimit:portal/tp_to with storage overlimit:portal tp
function overlimit:portal/release
execute at @s if entity @e[type=minecraft:marker,tag=overlimit.bw_portal,distance=..48] run function overlimit:portal/stand_front
execute at @s if entity @e[type=minecraft:marker,tag=overlimit.bw_portal,distance=..48] run return run function overlimit:portal/arrive_done
function overlimit:portal/gate_lost
execute unless predicate overlimit:in_blood_world run return run function overlimit:portal/to_blood_new
return run function overlimit:portal/land_here
