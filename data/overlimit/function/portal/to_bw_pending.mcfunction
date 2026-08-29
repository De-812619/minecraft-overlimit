# 門の生成待ち。先着がブラッドワールドにいればそこへ。いなければ同じ原点で門が立つまで OW に残る。
scoreboard players set #bw_preload overlimit.const 0
scoreboard players set #bw_warm overlimit.const 0
scoreboard players set #bw_warm_fail overlimit.const 0
tag @s add overlimit.to_bw
tag @s add overlimit.portal_arrive
scoreboard players set @s overlimit.portal_wait 0
execute if entity @a[tag=overlimit.to_bw,predicate=overlimit:in_blood_world] run tp @s @a[tag=overlimit.to_bw,predicate=overlimit:in_blood_world,limit=1]
execute if predicate overlimit:in_overworld run function overlimit:portal/stand_front
execute if predicate overlimit:in_overworld run function overlimit:portal/hold_player
function overlimit:portal/status_bar
execute if predicate overlimit:in_overworld if data storage overlimit:portal origin.x run function overlimit:portal/try_place_at with storage overlimit:portal origin
execute if entity @s[tag=overlimit.portal_arrive] run schedule function overlimit:portal/arrive 1t replace
