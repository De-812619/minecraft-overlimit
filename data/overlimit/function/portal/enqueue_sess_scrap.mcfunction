# セッション門の座標を撤去キューへ足す。gates が空でも残骸を消す。
execute unless score #bw_sess_x overlimit.const matches -2147483648.. run return fail
data modify storage overlimit:portal scrap_queue append value {x:0,y:0,z:0}
execute store result storage overlimit:portal scrap_queue[-1].x int 1 run scoreboard players get #bw_sess_x overlimit.const
execute store result storage overlimit:portal scrap_queue[-1].y int 1 run scoreboard players get #bw_sess_y overlimit.const
execute store result storage overlimit:portal scrap_queue[-1].z int 1 run scoreboard players get #bw_sess_z overlimit.const
