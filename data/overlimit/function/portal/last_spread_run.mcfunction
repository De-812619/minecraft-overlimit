$execute in overlimit:blood_world run spreadplayers $(x) $(z) 8 2000 false @s
execute store result storage overlimit:portal pend.x int 1 run data get entity @s Pos[0]
execute store result storage overlimit:portal pend.y int 1 run data get entity @s Pos[1]
execute store result storage overlimit:portal pend.z int 1 run data get entity @s Pos[2]
data modify storage overlimit:portal pend.dim set value "overlimit:blood_world"
execute as @a[tag=overlimit.portal_arrive] if predicate overlimit:in_blood_world run function overlimit:portal/tp_search with storage overlimit:portal pend
scoreboard players set @a[tag=overlimit.portal_arrive] overlimit.portal_wait 0
execute at @s if function overlimit:portal/find_land run return run function overlimit:portal/arrive_done
tellraw @s {"text":"[overlimit] 陸地が見つからなかった。別の場所のゲートから入ってください","color":"red"}
function overlimit:portal/arrive_done
