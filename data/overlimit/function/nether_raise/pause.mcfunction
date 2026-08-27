execute if score #nr_paused overlimit.const matches 1 run return fail
scoreboard players set #nr_paused overlimit.const 1
scoreboard players set #nr_pc_prev overlimit.const 0
# 無人中は送信を止め、復帰時の refresh で付け直す
execute in minecraft:the_nether as @e[type=minecraft:armor_stand,tag=overlimit.nr_waypoint] run attribute @s minecraft:waypoint_transmit_range base set 0
bossbar set overlimit:nether_raise players @a[predicate=overlimit:in_nether]
tellraw @a[predicate=overlimit:in_nether] {"text":"ネザーに参加者がいなくなった。イベントを一時停止した。","color":"gray"}
