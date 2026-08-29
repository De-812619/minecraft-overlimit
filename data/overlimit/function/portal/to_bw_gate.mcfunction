# セッション門へ。座標はグローバル（プレイヤーごとの bw_has は使わない）。
scoreboard players set #bw_preload overlimit.const 0
scoreboard players set #bw_warm overlimit.const 0
scoreboard players set #bw_warm_fail overlimit.const 0
tag @s add overlimit.in_bw
tag @s add overlimit.portal_arrive
scoreboard players set @s overlimit.portal_wait 0
function overlimit:portal/release
execute store result storage overlimit:portal tp.x int 1 run scoreboard players get #bw_sess_x overlimit.const
execute store result storage overlimit:portal tp.y int 1 run scoreboard players get #bw_sess_y overlimit.const
execute store result storage overlimit:portal tp.z int 1 run scoreboard players get #bw_sess_z overlimit.const
data modify storage overlimit:portal tp.dim set value "overlimit:blood_world"
function overlimit:portal/tp_to with storage overlimit:portal tp
schedule function overlimit:portal/arrive 1t replace
