function overlimit:nether_overflow/pick_gate
execute unless entity @e[type=minecraft:marker,tag=overlimit.no_target] run return fail

scoreboard players set #no_active overlimit.const 1
scoreboard players set #no_paused overlimit.const 0
scoreboard players set #no_dusk overlimit.const 0
scoreboard players set #no_t overlimit.const 0
scoreboard players set #no_phase overlimit.const 1
scoreboard players set #no_phase_t overlimit.const 0
scoreboard players set #no_spawned overlimit.const 0
scoreboard players set #no_ghast_n overlimit.const 0
scoreboard players set #no_ghast_cd overlimit.const 0
scoreboard players set #no_spawn_t overlimit.const 0
scoreboard players operation #no_budget overlimit.const = #no_budget1 overlimit.const
scoreboard players operation #no_int overlimit.const = #no_int1 overlimit.const

execute as @e[type=minecraft:marker,tag=overlimit.no_target,limit=1] at @s run function overlimit:nether_overflow/store_gate
function overlimit:nether_overflow/forceload_on
function overlimit:nether_overflow/assign_core
execute as @e[type=minecraft:marker,tag=overlimit.no_target,limit=1] at @s run function overlimit:nether_overflow/spawn_burst
execute as @e[type=minecraft:marker,tag=overlimit.no_target,limit=1] at @s run function overlimit:nether_overflow/ensure_ghast

bossbar set overlimit:nether_overflow color purple
execute store result bossbar overlimit:nether_overflow max run scoreboard players get #no_time_max overlimit.const
bossbar set overlimit:nether_overflow visible true
function overlimit:nether_overflow/bossbar_name
function overlimit:nether_overflow/bossbar_value
bossbar set overlimit:nether_overflow players @a[predicate=overlimit:in_overworld]

title @a[predicate=overlimit:in_overworld] times 10 70 20
title @a[predicate=overlimit:in_overworld] title {"text":"ネザーオーバーフロー","color":"dark_purple","bold":true}
title @a[predicate=overlimit:in_overworld] subtitle {"text":"ゲートの敵を殲滅せよ","color":"gold"}
execute as @a[predicate=overlimit:in_overworld] at @s run playsound minecraft:block.portal.trigger player @s ~ ~ ~ 0.7 0.6
tellraw @a[predicate=overlimit:in_overworld] {"text":"ネザーゲートから敵が溢れ出した。制限時間内に殲滅せよ。","color":"light_purple"}
