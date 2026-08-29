scoreboard players add @s overlimit.portal_wait 1
execute if score @s overlimit.portal_wait matches 200.. run return run function overlimit:portal/search_stuck
execute store result storage overlimit:portal tp.x int 1 run scoreboard players get #bw_sess_x overlimit.const
execute store result storage overlimit:portal tp.y int 1 run scoreboard players get #bw_sess_y overlimit.const
execute store result storage overlimit:portal tp.z int 1 run scoreboard players get #bw_sess_z overlimit.const
data modify storage overlimit:portal tp.dim set value "overlimit:blood_world"
function overlimit:portal/tp_to with storage overlimit:portal tp
execute if predicate overlimit:in_blood_world run return run function overlimit:portal/arrive_join_gate
