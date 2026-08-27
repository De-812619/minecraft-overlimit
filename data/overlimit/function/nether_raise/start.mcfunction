scoreboard players set #nr_active overlimit.const 1
scoreboard players set #nr_combat overlimit.const 0
scoreboard players set #nr_paused overlimit.const 0
scoreboard players set #nr_arrived overlimit.const 0
scoreboard players set #nr_t overlimit.const 0
scoreboard players set #nr_phase overlimit.const 1
scoreboard players set #nr_phase_t overlimit.const 0
scoreboard players set #nr_spawned overlimit.const 0
scoreboard players set #nr_ghast_n overlimit.const 0
scoreboard players set #nr_ghast_cd overlimit.const 0
scoreboard players set #nr_spawn_t overlimit.const 0
scoreboard players set #nr_dwell overlimit.const 0
scoreboard players set #nr_gather_t overlimit.const 0
execute store result score #nr_pc_prev overlimit.const if entity @a[predicate=overlimit:in_nether,gamemode=!spectator]
scoreboard players operation #nr_budget overlimit.const = #nr_budget1 overlimit.const
scoreboard players operation #nr_int overlimit.const = #nr_int1 overlimit.const

kill @e[type=minecraft:marker,tag=overlimit.nr_target]
kill @e[type=minecraft:armor_stand,tag=overlimit.nr_waypoint]
function overlimit:nether_raise/forceload_on
function overlimit:nether_raise/spawn_target with storage overlimit:nr target
function overlimit:nether_raise/spawn_waypoint with storage overlimit:nr target

bossbar set overlimit:nether_raise color yellow
execute store result bossbar overlimit:nether_raise max run scoreboard players get #nr_time_max overlimit.const
bossbar set overlimit:nether_raise visible true
function overlimit:nether_raise/bossbar_name
function overlimit:nether_raise/bossbar_value
bossbar set overlimit:nether_raise players @a[predicate=overlimit:in_nether]

title @a[predicate=overlimit:in_nether] times 10 70 20
title @a[predicate=overlimit:in_nether] title {"text":"ネザーレイズ","color":"gold","bold":true}
execute as @a[predicate=overlimit:in_nether] at @s run playsound minecraft:entity.wither.spawn player @s ~ ~ ~ 0.45 0.55
execute if score #nr_kind_id overlimit.const matches 1 run tellraw @a[predicate=overlimit:in_nether] ["",{"text":"ネザーレイズが始まった。","color":"gold"},{"text":" 要塞（","color":"yellow"},{"nbt":"target.x","storage":"overlimit:nr"},{"text":", ","color":"yellow"},{"nbt":"target.y","storage":"overlimit:nr"},{"text":", ","color":"yellow"},{"nbt":"target.z","storage":"overlimit:nr"},{"text":"）へ向かえ。","color":"yellow"},{"text":" （ヒート ","color":"gold"},{"score":{"name":"#heat","objective":"overlimit.const"},"color":"gold"},{"text":"）","color":"gold"}]
execute if score #nr_kind_id overlimit.const matches 2 run tellraw @a[predicate=overlimit:in_nether] ["",{"text":"ネザーレイズが始まった。","color":"gold"},{"text":" バストリオン（","color":"yellow"},{"nbt":"target.x","storage":"overlimit:nr"},{"text":", ","color":"yellow"},{"nbt":"target.y","storage":"overlimit:nr"},{"text":", ","color":"yellow"},{"nbt":"target.z","storage":"overlimit:nr"},{"text":"）へ向かえ。","color":"yellow"},{"text":" （ヒート ","color":"gold"},{"score":{"name":"#heat","objective":"overlimit.const"},"color":"gold"},{"text":"）","color":"gold"}]
tellraw @a[predicate=overlimit:in_nether,tag=!overlimit.nr_core] {"text":"32マス以内に入ると戦闘が始まる。","color":"gray"}
