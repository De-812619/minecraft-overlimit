# 前回セッション地点も消す。再入場先を変えたあとに残った古い門の残骸用。
execute unless score #bw_origin_from_gate overlimit.const matches 1 run return fail
execute unless score #bw_origin_x overlimit.const matches -2147483648.. run return fail
data modify storage overlimit:portal scrap_queue append value {x:0,y:64,z:0}
execute store result storage overlimit:portal scrap_queue[-1].x int 1 run scoreboard players get #bw_origin_x overlimit.const
execute store result storage overlimit:portal scrap_queue[-1].z int 1 run scoreboard players get #bw_origin_z overlimit.const
execute if score #bw_sess_y overlimit.const matches -2147483648.. store result storage overlimit:portal scrap_queue[-1].y int 1 run scoreboard players get #bw_sess_y overlimit.const
