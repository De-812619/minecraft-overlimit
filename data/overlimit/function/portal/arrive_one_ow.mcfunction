# 入ってきたオーバーワールドの門へ戻る。無ければ同じ座標に建て直す（別地点へは移さない）。
execute unless loaded ~ ~ ~ run return fail
execute unless entity @e[type=minecraft:marker,tag=overlimit.bw_fl,distance=..4] run summon minecraft:marker ~ ~ ~ {Tags:["overlimit.bw_fl"]}
execute if entity @e[type=minecraft:marker,tag=overlimit.bw_portal,distance=..16] run return run function overlimit:portal/arrive_ow_ok
scoreboard players add @s overlimit.portal_wait 1
execute if score @s overlimit.portal_wait matches 150.. run return run function overlimit:portal/rebuild_ow_here
