execute store result score #no_diff overlimit.const run difficulty
execute if score #no_diff overlimit.const matches 0 run return run function overlimit:nether_overflow/end_cancel

execute unless entity @e[type=minecraft:marker,tag=overlimit.no_target] run function overlimit:nether_overflow/respawn_target
scoreboard players set #no_wpc overlimit.const 0
execute in minecraft:overworld as @e[type=minecraft:armor_stand,tag=overlimit.no_waypoint] run scoreboard players add #no_wpc overlimit.const 1
execute if score #no_wpc overlimit.const matches 0 run function overlimit:nether_overflow/spawn_waypoint with storage overlimit:no gate
execute if score #no_wpc overlimit.const matches 2.. run function overlimit:nether_overflow/spawn_waypoint with storage overlimit:no gate

execute unless entity @a[predicate=overlimit:in_overworld,gamemode=!spectator] run return run function overlimit:nether_overflow/pause
execute as @a[tag=overlimit.no_core] unless predicate overlimit:in_overworld run function overlimit:nether_overflow/transfer_core
execute unless entity @a[tag=overlimit.no_core,predicate=overlimit:in_overworld,gamemode=!spectator] run function overlimit:nether_overflow/transfer_core
execute unless entity @a[tag=overlimit.no_core,predicate=overlimit:in_overworld,gamemode=!spectator] run return run function overlimit:nether_overflow/pause

execute if score #no_paused overlimit.const matches 1 run function overlimit:nether_overflow/resume
execute in minecraft:overworld as @e[type=minecraft:armor_stand,tag=overlimit.no_waypoint] run function overlimit:nether_overflow/ensure_waypoint
execute store result score #no_pc overlimit.const if entity @a[predicate=overlimit:in_overworld,gamemode=!spectator]
execute if score #no_pc overlimit.const > #no_pc_prev overlimit.const run function overlimit:nether_overflow/refresh_waypoint
scoreboard players operation #no_pc_prev overlimit.const = #no_pc overlimit.const

execute as @a[tag=overlimit.no_core,scores={overlimit.no_deaths=1..}] run return run function overlimit:nether_overflow/end_fail

bossbar set overlimit:nether_overflow players @a[predicate=overlimit:in_overworld]
function overlimit:nether_overflow/bossbar_value
function overlimit:nether_overflow/bossbar_name
execute at @a[tag=overlimit.no_core,limit=1] run particle minecraft:portal ~ ~1 ~ 0.3 0.5 0.3 0.02 2
function overlimit:nether_overflow/cull_zpig
function overlimit:nether_overflow/cull_far

scoreboard players add #no_t overlimit.const 1
scoreboard players add #no_phase_t overlimit.const 1
scoreboard players add #no_spawn_t overlimit.const 1
scoreboard players operation #no_amod overlimit.const = #no_t overlimit.const
scoreboard players operation #no_amod overlimit.const %= #20 overlimit.const
execute if score #no_amod overlimit.const matches 0 as @e[tag=overlimit.no_wave,tag=!overlimit.no_ghast] at @s run function overlimit:nether_overflow/anger
execute if score #no_amod overlimit.const matches 0 as @e[tag=overlimit.no_wave,tag=!overlimit.no_ghast] run function overlimit:nether_overflow/glow
execute if score #no_amod overlimit.const matches 0 as @e[tag=overlimit.no_ghast] run effect clear @s minecraft:glowing
execute if score #no_arrived overlimit.const matches 0 run function overlimit:nether_overflow/try_arrive
execute if score #no_arrived overlimit.const matches 1 as @e[type=minecraft:marker,tag=overlimit.no_target,limit=1] at @s run function overlimit:nether_overflow/ensure_ghast
execute if score #no_arrived overlimit.const matches 1 if score #no_spawn_t overlimit.const >= #no_int overlimit.const run function overlimit:nether_overflow/spawn_pulse
function overlimit:nether_overflow/check_clear
execute if score #no_active overlimit.const matches 1 if score #no_phase_t overlimit.const >= #no_phase_max overlimit.const if score #no_phase overlimit.const matches ..2 run function overlimit:nether_overflow/phase_next
execute if score #no_active overlimit.const matches 1 if score #no_t overlimit.const >= #no_time_max overlimit.const run function overlimit:nether_overflow/end_timeout
