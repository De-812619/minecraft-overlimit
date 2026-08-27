function overlimit:city_clamp/forceload_on
function overlimit:city_clamp/spawn_target with storage overlimit:cc target
function overlimit:city_clamp/bossbar_name
function overlimit:city_clamp/bossbar_value
bossbar set overlimit:city_clamp color blue
execute store result bossbar overlimit:city_clamp max run scoreboard players get #cc_time_max overlimit.const
bossbar set overlimit:city_clamp style progress
bossbar set overlimit:city_clamp visible true
bossbar set overlimit:city_clamp players @a[predicate=overlimit:in_the_end]
execute if entity @a[tag=overlimit.cc_core] run effect give @a[tag=overlimit.cc_core] minecraft:glowing 1000000 0 true
execute if score #cc_phase overlimit.const matches 1 run scoreboard players operation #cc_int overlimit.const = #cc_int1 overlimit.const
execute if score #cc_phase overlimit.const matches 2 run scoreboard players operation #cc_int overlimit.const = #cc_int2 overlimit.const
execute if score #cc_phase overlimit.const matches 3 run scoreboard players operation #cc_int overlimit.const = #cc_int3 overlimit.const
execute if entity @e[type=minecraft:armor_stand,tag=overlimit.cc_waypoint,limit=1] run return 1
function overlimit:city_clamp/spawn_waypoint with storage overlimit:cc target
