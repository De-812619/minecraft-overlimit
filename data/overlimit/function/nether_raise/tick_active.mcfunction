execute store result score #nr_diff overlimit.const run difficulty
execute if score #nr_diff overlimit.const matches 0 run return run function overlimit:nether_raise/end_cancel

execute in minecraft:the_nether unless entity @e[type=minecraft:marker,tag=overlimit.nr_target] run function overlimit:nether_raise/spawn_target with storage overlimit:nr target
scoreboard players set #nr_wpc overlimit.const 0
execute in minecraft:the_nether as @e[type=minecraft:armor_stand,tag=overlimit.nr_waypoint] run scoreboard players add #nr_wpc overlimit.const 1
execute if score #nr_wpc overlimit.const matches 0 run function overlimit:nether_raise/spawn_waypoint with storage overlimit:nr target
execute if score #nr_wpc overlimit.const matches 2.. run function overlimit:nether_raise/spawn_waypoint with storage overlimit:nr target

execute unless entity @a[predicate=overlimit:in_nether,gamemode=!spectator] run return run function overlimit:nether_raise/pause
execute if score #nr_combat overlimit.const matches 1 as @a[tag=overlimit.nr_core] unless predicate overlimit:in_nether run function overlimit:nether_raise/transfer_core
execute if score #nr_combat overlimit.const matches 1 unless entity @a[tag=overlimit.nr_core,predicate=overlimit:in_nether,gamemode=!spectator] run function overlimit:nether_raise/transfer_core
execute if score #nr_combat overlimit.const matches 1 unless entity @a[tag=overlimit.nr_core,predicate=overlimit:in_nether,gamemode=!spectator] run return run function overlimit:nether_raise/pause

execute if score #nr_paused overlimit.const matches 1 run function overlimit:nether_raise/resume
execute in minecraft:the_nether as @e[type=minecraft:armor_stand,tag=overlimit.nr_waypoint] run function overlimit:nether_raise/ensure_waypoint

# 人数が増えた＝誰かが戻った／入ったのでロケーターを付け直す（他者が残っている場合の復帰も含む）
execute store result score #nr_pc overlimit.const if entity @a[predicate=overlimit:in_nether,gamemode=!spectator]
execute if score #nr_pc overlimit.const > #nr_pc_prev overlimit.const run function overlimit:nether_raise/refresh_waypoint
scoreboard players operation #nr_pc_prev overlimit.const = #nr_pc overlimit.const

execute if score #nr_combat overlimit.const matches 1 as @a[tag=overlimit.nr_core,scores={overlimit.nr_deaths=1..}] run return run function overlimit:nether_raise/end_fail

bossbar set overlimit:nether_raise players @a[predicate=overlimit:in_nether]
function overlimit:nether_raise/bossbar_value
function overlimit:nether_raise/bossbar_name

scoreboard players operation #nr_amod overlimit.const = #nr_t overlimit.const
scoreboard players operation #nr_amod overlimit.const %= #20 overlimit.const
execute if score #nr_amod overlimit.const matches 0 if score #nr_combat overlimit.const matches 1 as @e[tag=overlimit.nr_wave,tag=!overlimit.nr_ghast] at @s run function overlimit:nether_raise/anger
execute if score #nr_amod overlimit.const matches 0 if score #nr_combat overlimit.const matches 1 as @e[tag=overlimit.nr_wave,tag=!overlimit.nr_ghast] at @s run function overlimit:nether_raise/glow
execute if score #nr_amod overlimit.const matches 0 if score #nr_combat overlimit.const matches 1 as @e[tag=overlimit.nr_ghast] run effect clear @s minecraft:glowing

execute if score #nr_arrived overlimit.const matches 0 run function overlimit:nether_raise/try_arrive
execute if score #nr_arrived overlimit.const matches 0 run scoreboard players add #nr_gather_t overlimit.const 1
execute if score #nr_arrived overlimit.const matches 0 if score #nr_gather_t overlimit.const matches 20.. run scoreboard players set #nr_gather_t overlimit.const 0
execute if score #nr_arrived overlimit.const matches 0 if score #nr_gather_t overlimit.const matches 1 run function overlimit:nether_raise/guide_tick

execute if score #nr_combat overlimit.const matches 1 as @e[type=minecraft:marker,tag=overlimit.nr_target,limit=1] at @s run function overlimit:nether_raise/ensure_ghast
execute if score #nr_combat overlimit.const matches 1 if score #nr_spawn_t overlimit.const >= #nr_int overlimit.const run function overlimit:nether_raise/spawn_pulse
execute if score #nr_combat overlimit.const matches 1 run function overlimit:nether_raise/cull_far
execute if score #nr_combat overlimit.const matches 1 run function overlimit:nether_raise/cull_vanilla

execute if score #nr_combat overlimit.const matches 1 run scoreboard players add #nr_t overlimit.const 1
execute if score #nr_combat overlimit.const matches 1 run scoreboard players add #nr_phase_t overlimit.const 1
execute if score #nr_combat overlimit.const matches 1 run scoreboard players add #nr_spawn_t overlimit.const 1

execute if score #nr_combat overlimit.const matches 1 run function overlimit:nether_raise/check_clear
execute if score #nr_combat overlimit.const matches 1 if score #nr_phase_t overlimit.const >= #nr_phase_max overlimit.const if score #nr_phase overlimit.const matches ..2 run function overlimit:nether_raise/phase_next
execute if score #nr_combat overlimit.const matches 1 if score #nr_t overlimit.const >= #nr_time_max overlimit.const run function overlimit:nether_raise/end_timeout
