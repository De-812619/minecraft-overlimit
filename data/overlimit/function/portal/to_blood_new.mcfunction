# 新しいセッション。プレイヤー自身を陸地へ spreadplayers してから門を置く（探索中に海へ落とさない）。
scoreboard players set #bw_pending overlimit.const 1
scoreboard players set #bw_sess overlimit.const 1
scoreboard players set #bw_rand_n overlimit.const 0
scoreboard players set #bw_spread overlimit.const 0
tag @s add overlimit.to_bw
tag @s add overlimit.portal_arrive
scoreboard players set @s overlimit.portal_wait 0
function overlimit:portal/roll_dest
function overlimit:portal/spread_to_land with storage overlimit:portal origin
function overlimit:portal/nausea_off
execute if predicate overlimit:in_overworld run function overlimit:portal/stand_front
schedule function overlimit:portal/arrive 2t replace
