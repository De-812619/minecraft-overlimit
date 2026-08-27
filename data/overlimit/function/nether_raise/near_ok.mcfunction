# 実行位置に最寄プレイヤーが水平 #nr_near_lim 以内にいるか。
scoreboard players set #nr_near_p overlimit.const 0
execute summon minecraft:marker ~ ~ ~ {Tags:["overlimit.nr_sp"]} run function overlimit:nether_raise/near_scan
execute if score #nr_near_p overlimit.const matches 1 run return 1
return fail
