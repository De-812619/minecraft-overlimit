scoreboard players set #nr_active overlimit.const 0
scoreboard players set #nr_combat overlimit.const 0
scoreboard players set #nr_paused overlimit.const 0
scoreboard players set #nr_arrived overlimit.const 0
scoreboard players set #nr_t overlimit.const 0
scoreboard players set #nr_spawn_t overlimit.const 0
scoreboard players set #nr_spawned overlimit.const 0
scoreboard players set #nr_phase_t overlimit.const 0
bossbar set overlimit:nether_raise visible false
bossbar set overlimit:nether_raise value 0
bossbar set overlimit:nether_raise players
effect clear @a[tag=overlimit.nr_core] minecraft:glowing
tag @a remove overlimit.nr_core
tag @a remove overlimit.nr_pick
execute as @e[tag=overlimit.nr_wave] run tag @s add overlimit.bm_scored
execute as @e[tag=overlimit.nr_wave] at @s run function overlimit:blood_moon/despawn_one
kill @e[tag=overlimit.nr_wave]
kill @e[type=minecraft:marker,tag=overlimit.nr_target]
kill @e[type=minecraft:armor_stand,tag=overlimit.nr_waypoint]
function overlimit:nether_raise/forceload_off
