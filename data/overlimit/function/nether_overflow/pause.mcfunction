execute if score #no_paused overlimit.const matches 1 run return fail
scoreboard players set #no_paused overlimit.const 1
scoreboard players set #no_pc_prev overlimit.const 0
execute in minecraft:overworld as @e[type=minecraft:armor_stand,tag=overlimit.no_waypoint] run attribute @s minecraft:waypoint_transmit_range base set 0
bossbar set overlimit:nether_overflow players @a[predicate=overlimit:in_overworld]
tellraw @a[predicate=overlimit:in_overworld] {"text":"コア所持者がいなくなった。防衛を一時停止した。","color":"gray"}
