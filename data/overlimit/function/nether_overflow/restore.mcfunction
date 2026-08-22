function overlimit:nether_overflow/respawn_target
function overlimit:nether_overflow/forceload_on
function overlimit:nether_overflow/bossbar_name
function overlimit:nether_overflow/bossbar_value
bossbar set overlimit:nether_overflow color purple
execute store result bossbar overlimit:nether_overflow max run scoreboard players get #no_time_max overlimit.const
bossbar set overlimit:nether_overflow style progress
bossbar set overlimit:nether_overflow visible true
bossbar set overlimit:nether_overflow players @a[predicate=overlimit:in_overworld]
execute if entity @a[tag=overlimit.no_core] run effect give @a[tag=overlimit.no_core] minecraft:glowing 1000000 0 true
execute if score #no_phase overlimit.const matches 1 run scoreboard players operation #no_int overlimit.const = #no_int1 overlimit.const
execute if score #no_phase overlimit.const matches 2 run scoreboard players operation #no_int overlimit.const = #no_int2 overlimit.const
execute if score #no_phase overlimit.const matches 3 run scoreboard players operation #no_int overlimit.const = #no_int3 overlimit.const
