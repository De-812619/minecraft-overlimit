scoreboard players set #no_active overlimit.const 0
scoreboard players set #no_paused overlimit.const 0
scoreboard players set #no_arrived overlimit.const 0
scoreboard players set #no_t overlimit.const 0
scoreboard players set #no_spawn_t overlimit.const 0
scoreboard players set #no_spawned overlimit.const 0
scoreboard players set #no_phase_t overlimit.const 0
bossbar set overlimit:nether_overflow visible false
bossbar set overlimit:nether_overflow value 0
bossbar set overlimit:nether_overflow players
effect clear @a[tag=overlimit.no_core] minecraft:glowing
tag @a remove overlimit.no_core
execute as @e[tag=overlimit.no_wave] run tag @s add overlimit.bm_scored
execute as @e[tag=overlimit.no_wave] at @s run function overlimit:blood_moon/despawn_one
kill @e[tag=overlimit.no_wave]
kill @e[type=minecraft:marker,tag=overlimit.no_yh]
tag @e[type=minecraft:marker,tag=overlimit.no_gate] remove overlimit.no_target
execute if score #no_boost_active overlimit.const matches 1 run function overlimit:heat/refresh
scoreboard players set #no_boost_active overlimit.const 0
execute unless score #no_nethering overlimit.const matches 1 run function overlimit:nether_overflow/forceload_off
