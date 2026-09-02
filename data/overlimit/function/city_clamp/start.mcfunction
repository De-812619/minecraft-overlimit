scoreboard players set #cc_active overlimit.const 1
scoreboard players set #cc_combat overlimit.const 0
scoreboard players set #cc_paused overlimit.const 0
scoreboard players set #cc_arrived overlimit.const 0
scoreboard players set #cc_t overlimit.const 0
scoreboard players set #cc_phase overlimit.const 1
scoreboard players set #cc_phase_t overlimit.const 0
scoreboard players set #cc_spawned overlimit.const 0
scoreboard players set #cc_shul_n overlimit.const 0
scoreboard players set #cc_boss overlimit.const 0
scoreboard players set #cc_spawn_t overlimit.const 0
scoreboard players set #cc_dwell overlimit.const 0
scoreboard players set #cc_gather_t overlimit.const 0
execute store result score #cc_pc_prev overlimit.const if entity @a[predicate=overlimit:in_the_end,gamemode=!spectator]
scoreboard players operation #cc_budget overlimit.const = #cc_budget1 overlimit.const
scoreboard players operation #cc_int overlimit.const = #cc_int1 overlimit.const

kill @e[type=minecraft:marker,tag=overlimit.cc_target]
kill @e[type=minecraft:armor_stand,tag=overlimit.cc_waypoint]
function overlimit:city_clamp/forceload_on
function overlimit:city_clamp/spawn_target with storage overlimit:cc target
function overlimit:city_clamp/spawn_waypoint with storage overlimit:cc target

bossbar set overlimit:city_clamp color blue
execute store result bossbar overlimit:city_clamp max run scoreboard players get #cc_time_max overlimit.const
bossbar set overlimit:city_clamp visible true
function overlimit:city_clamp/bossbar_name
function overlimit:city_clamp/bossbar_value
bossbar set overlimit:city_clamp players @a[predicate=overlimit:in_the_end]

title @a[predicate=overlimit:in_the_end] times 10 70 20
title @a[predicate=overlimit:in_the_end] title {"text":"シティクランプ","color":"blue","bold":true}
execute as @a[predicate=overlimit:in_the_end] at @s run playsound minecraft:entity.wither.spawn player @s ~ ~ ~ 0.45 0.55
tellraw @a[predicate=overlimit:in_the_end] ["",{"text":"シティクランプが始まった。エンドシティがカオスに陥り、本来いない敵も現れる。","color":"blue"},{"text":" （","color":"aqua"},{"nbt":"target.x","storage":"overlimit:cc"},{"text":", ","color":"aqua"},{"nbt":"target.y","storage":"overlimit:cc"},{"text":", ","color":"aqua"},{"nbt":"target.z","storage":"overlimit:cc"},{"text":"）","color":"aqua"},{"text":" （脅威指数 ","color":"gold"},{"score":{"name":"#heat","objective":"overlimit.const"},"color":"gold"},{"text":"）","color":"gold"}]
function overlimit:city_clamp/begin_combat
