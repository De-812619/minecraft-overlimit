execute store result storage overlimit:portal tp.x int 1 run scoreboard players get #bw_sess_x overlimit.const
execute store result storage overlimit:portal tp.y int 1 run scoreboard players get #bw_sess_y overlimit.const
execute store result storage overlimit:portal tp.z int 1 run scoreboard players get #bw_sess_z overlimit.const
data modify storage overlimit:portal tp.dim set value "overlimit:blood_world"
function overlimit:portal/tp_to with storage overlimit:portal tp
execute at @s if function overlimit:portal/ensure run return run function overlimit:portal/arrive_done
execute at @s run function overlimit:portal/stand_front
function overlimit:portal/arrive_done
