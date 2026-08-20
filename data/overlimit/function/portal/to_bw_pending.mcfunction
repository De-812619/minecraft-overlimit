# 門の生成待ち。先着がブラッドワールドにいればそこへ。いなければ同じ原点で陸地へ。
tag @s add overlimit.to_bw
tag @s add overlimit.portal_arrive
scoreboard players set @s overlimit.portal_wait 0
execute if entity @a[tag=overlimit.to_bw,predicate=overlimit:in_blood_world] run tp @s @a[tag=overlimit.to_bw,predicate=overlimit:in_blood_world,limit=1]
execute if predicate overlimit:in_overworld run function overlimit:portal/spread_to_land with storage overlimit:portal origin
function overlimit:portal/nausea_off
execute if predicate overlimit:in_overworld run function overlimit:portal/stand_front
schedule function overlimit:portal/arrive 2t replace
