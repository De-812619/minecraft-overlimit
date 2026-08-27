function overlimit:nether_raise/forceload_on
function overlimit:nether_raise/spawn_target with storage overlimit:nr target
function overlimit:nether_raise/bossbar_name
function overlimit:nether_raise/bossbar_value
bossbar set overlimit:nether_raise color yellow
execute store result bossbar overlimit:nether_raise max run scoreboard players get #nr_time_max overlimit.const
bossbar set overlimit:nether_raise style progress
bossbar set overlimit:nether_raise visible true
bossbar set overlimit:nether_raise players @a[predicate=overlimit:in_nether]
execute if entity @a[tag=overlimit.nr_core] run effect give @a[tag=overlimit.nr_core] minecraft:glowing 1000000 0 true
execute if score #nr_phase overlimit.const matches 1 run scoreboard players operation #nr_int overlimit.const = #nr_int1 overlimit.const
execute if score #nr_phase overlimit.const matches 2 run scoreboard players operation #nr_int overlimit.const = #nr_int2 overlimit.const
execute if score #nr_phase overlimit.const matches 3 run scoreboard players operation #nr_int overlimit.const = #nr_int3 overlimit.const
execute if entity @e[type=minecraft:armor_stand,tag=overlimit.nr_waypoint,limit=1] run return 1
function overlimit:nether_raise/spawn_waypoint with storage overlimit:nr target
