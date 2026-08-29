# 新しいセッション。チャージ中の先読みがあればそれを使い、門ができるまで OW に残る。
scoreboard players set #bw_pending overlimit.const 1
scoreboard players set #bw_sess overlimit.const 1
scoreboard players set #bw_spread overlimit.const 0
execute unless score #bw_preload overlimit.const matches 1 run scoreboard players set #bw_rand_n overlimit.const 0
tag @s add overlimit.to_bw
tag @s add overlimit.portal_arrive
scoreboard players set @s overlimit.portal_wait 0
execute unless score #bw_preload overlimit.const matches 1 unless function overlimit:portal/pick_landmark run return run function overlimit:portal/search_stuck
scoreboard players set #bw_preload overlimit.const 0
scoreboard players set #bw_warm overlimit.const 0
scoreboard players set #bw_warm_fail overlimit.const 0
execute if data storage overlimit:portal origin.x run function overlimit:portal/forceload_dest with storage overlimit:portal origin
execute if predicate overlimit:in_overworld run function overlimit:portal/stand_front
execute if predicate overlimit:in_overworld run function overlimit:portal/hold_player
function overlimit:portal/status_bar
execute if data storage overlimit:portal origin.x run function overlimit:portal/try_place_at with storage overlimit:portal origin
execute if entity @s[tag=overlimit.portal_arrive] run schedule function overlimit:portal/arrive 1t replace
