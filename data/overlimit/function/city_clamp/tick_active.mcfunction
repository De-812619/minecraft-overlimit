execute store result score #cc_diff overlimit.const run difficulty
execute if score #cc_diff overlimit.const matches 0 run return run function overlimit:city_clamp/end_cancel

execute in minecraft:the_end unless entity @e[type=minecraft:marker,tag=overlimit.cc_target] run function overlimit:city_clamp/spawn_target with storage overlimit:cc target
scoreboard players set #cc_wpc overlimit.const 0
execute in minecraft:the_end as @e[type=minecraft:armor_stand,tag=overlimit.cc_waypoint] run scoreboard players add #cc_wpc overlimit.const 1
execute if score #cc_wpc overlimit.const matches 0 run function overlimit:city_clamp/spawn_waypoint with storage overlimit:cc target
execute if score #cc_wpc overlimit.const matches 2.. run function overlimit:city_clamp/spawn_waypoint with storage overlimit:cc target

execute unless entity @a[predicate=overlimit:in_the_end,gamemode=!spectator] run return run function overlimit:city_clamp/pause
execute if score #cc_combat overlimit.const matches 1 as @a[tag=overlimit.cc_core] unless predicate overlimit:in_the_end run function overlimit:city_clamp/transfer_core
execute if score #cc_combat overlimit.const matches 1 unless entity @a[tag=overlimit.cc_core,predicate=overlimit:in_the_end,gamemode=!spectator] run function overlimit:city_clamp/transfer_core
execute if score #cc_combat overlimit.const matches 1 unless entity @a[tag=overlimit.cc_core,predicate=overlimit:in_the_end,gamemode=!spectator] run return run function overlimit:city_clamp/pause

execute if score #cc_paused overlimit.const matches 1 run function overlimit:city_clamp/resume
execute in minecraft:the_end as @e[type=minecraft:armor_stand,tag=overlimit.cc_waypoint] run function overlimit:city_clamp/ensure_waypoint

execute store result score #cc_pc overlimit.const if entity @a[predicate=overlimit:in_the_end,gamemode=!spectator]
execute if score #cc_pc overlimit.const > #cc_pc_prev overlimit.const run function overlimit:city_clamp/refresh_waypoint
scoreboard players operation #cc_pc_prev overlimit.const = #cc_pc overlimit.const

execute if score #cc_combat overlimit.const matches 1 as @a[tag=overlimit.cc_core,scores={overlimit.cc_deaths=1..}] run return run function overlimit:city_clamp/end_fail

bossbar set overlimit:city_clamp players @a[predicate=overlimit:in_the_end]
function overlimit:city_clamp/bossbar_value
function overlimit:city_clamp/bossbar_name

scoreboard players operation #cc_amod overlimit.const = #cc_t overlimit.const
scoreboard players operation #cc_amod overlimit.const %= #20 overlimit.const
execute if score #cc_amod overlimit.const matches 0 if score #cc_combat overlimit.const matches 1 as @e[tag=overlimit.cc_wave] at @s run function overlimit:city_clamp/anger
execute if score #cc_amod overlimit.const matches 0 if score #cc_combat overlimit.const matches 1 as @e[tag=overlimit.cc_wave] at @s run function overlimit:city_clamp/glow

execute if score #cc_arrived overlimit.const matches 0 run function overlimit:city_clamp/try_arrive
execute if score #cc_arrived overlimit.const matches 0 run scoreboard players add #cc_gather_t overlimit.const 1
execute if score #cc_arrived overlimit.const matches 0 if score #cc_gather_t overlimit.const matches 20.. run scoreboard players set #cc_gather_t overlimit.const 0
execute if score #cc_arrived overlimit.const matches 0 if score #cc_gather_t overlimit.const matches 1 run function overlimit:city_clamp/guide_tick

execute if score #cc_combat overlimit.const matches 1 if score #cc_spawn_t overlimit.const >= #cc_int overlimit.const run function overlimit:city_clamp/spawn_pulse
execute if score #cc_combat overlimit.const matches 1 run function overlimit:city_clamp/cull_far
execute if score #cc_combat overlimit.const matches 1 run function overlimit:city_clamp/cull_vanilla

execute if score #cc_combat overlimit.const matches 1 run scoreboard players add #cc_t overlimit.const 1
execute if score #cc_combat overlimit.const matches 1 run scoreboard players add #cc_phase_t overlimit.const 1
execute if score #cc_combat overlimit.const matches 1 run scoreboard players add #cc_spawn_t overlimit.const 1

execute if score #cc_combat overlimit.const matches 1 run function overlimit:city_clamp/check_clear
execute if score #cc_combat overlimit.const matches 1 if score #cc_phase_t overlimit.const >= #cc_phase_max overlimit.const if score #cc_phase overlimit.const matches ..2 run function overlimit:city_clamp/phase_next
execute if score #cc_combat overlimit.const matches 1 if score #cc_t overlimit.const >= #cc_time_max overlimit.const run function overlimit:city_clamp/end_timeout
