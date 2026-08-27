scoreboard players set #cc_active overlimit.const 0
scoreboard players set #cc_combat overlimit.const 0
scoreboard players set #cc_paused overlimit.const 0
scoreboard players set #cc_arrived overlimit.const 0
scoreboard players set #cc_t overlimit.const 0
scoreboard players set #cc_spawn_t overlimit.const 0
scoreboard players set #cc_spawned overlimit.const 0
scoreboard players set #cc_shul_n overlimit.const 0
scoreboard players set #cc_boss overlimit.const 0
scoreboard players set #cc_phase_t overlimit.const 0
bossbar set overlimit:city_clamp visible false
bossbar set overlimit:city_clamp value 0
bossbar set overlimit:city_clamp players
effect clear @a[tag=overlimit.cc_core] minecraft:glowing
tag @a remove overlimit.cc_core
tag @a remove overlimit.cc_pick
execute as @e[tag=overlimit.cc_wave] run tag @s add overlimit.bm_scored
execute as @e[tag=overlimit.cc_wave] at @s run function overlimit:blood_moon/despawn_one
kill @e[tag=overlimit.cc_wave]
kill @e[type=minecraft:marker,tag=overlimit.cc_target]
kill @e[type=minecraft:armor_stand,tag=overlimit.cc_waypoint]
function overlimit:city_clamp/forceload_off
