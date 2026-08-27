execute if score #cc_paused overlimit.const matches 1 run return fail
scoreboard players set #cc_paused overlimit.const 1
scoreboard players set #cc_pc_prev overlimit.const 0
execute in minecraft:the_end as @e[type=minecraft:armor_stand,tag=overlimit.cc_waypoint] run attribute @s minecraft:waypoint_transmit_range base set 0
bossbar set overlimit:city_clamp players @a[predicate=overlimit:in_the_end]
tellraw @a[predicate=overlimit:in_the_end] {"text":"エンドに参加者がいなくなった。イベントを一時停止した。","color":"gray"}
