function overlimit:nether_overflow/pick_gate
execute unless score #no_picked overlimit.const matches 1 run return fail
function overlimit:nether_overflow/apply_fail_boost

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
scoreboard players set #no_arrived overlimit.const 0
scoreboard players operation #no_budget overlimit.const = #no_budget1 overlimit.const
scoreboard players operation #no_int overlimit.const = #no_int1 overlimit.const

function overlimit:nether_overflow/read_gate_scores
function overlimit:nether_overflow/forceload_on
function overlimit:nether_overflow/respawn_target
execute as @e[type=minecraft:marker,tag=overlimit.no_target,limit=1] at @s run function overlimit:nether_overflow/store_gate
function overlimit:nether_overflow/assign_core
execute store result score #no_pc_prev overlimit.const if entity @a[predicate=overlimit:in_overworld,gamemode=!spectator]
kill @e[type=minecraft:armor_stand,tag=overlimit.no_waypoint]
function overlimit:nether_overflow/spawn_waypoint with storage overlimit:no gate

bossbar set overlimit:nether_overflow color purple
execute store result bossbar overlimit:nether_overflow max run scoreboard players get #no_time_max overlimit.const
bossbar set overlimit:nether_overflow visible true
function overlimit:nether_overflow/bossbar_name
function overlimit:nether_overflow/bossbar_value
bossbar set overlimit:nether_overflow players @a[predicate=overlimit:in_overworld]

title @a[predicate=overlimit:in_overworld] times 10 70 20
title @a[predicate=overlimit:in_overworld] title {"text":"ネザーオーバーフロー","color":"dark_purple","bold":true}
title @a[predicate=overlimit:in_overworld] subtitle {"text":"ゲートから敵が溢れ出す","color":"gold"}
execute as @a[predicate=overlimit:in_overworld] at @s run playsound minecraft:block.portal.trigger player @s ~ ~ ~ 0.7 0.6
tellraw @a[predicate=overlimit:in_overworld] ["",{"text":"ネザーオーバーフローが発生した。ゲートから敵が溢れ出し、守れないと周囲がネザー化する。ゲート（","color":"light_purple"},{"nbt":"gate.x","storage":"overlimit:no"},{"text":", ","color":"light_purple"},{"nbt":"gate.y","storage":"overlimit:no"},{"text":", ","color":"light_purple"},{"nbt":"gate.z","storage":"overlimit:no"},{"text":"）へ向かえ。","color":"light_purple"},{"text":" （脅威指数 ","color":"gold"},{"score":{"name":"#heat","objective":"overlimit.const"},"color":"gold"},{"text":"）","color":"gold"}]
function overlimit:nether_overflow/try_arrive
