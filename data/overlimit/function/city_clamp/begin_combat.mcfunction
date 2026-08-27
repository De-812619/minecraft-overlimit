scoreboard players set #cc_arrived overlimit.const 1
scoreboard players set #cc_combat overlimit.const 1
scoreboard players set #cc_t overlimit.const 0
scoreboard players set #cc_phase_t overlimit.const 0
scoreboard players set #cc_spawn_t overlimit.const 0
function overlimit:city_clamp/assign_core
tellraw @a[predicate=overlimit:in_the_end] {"text":"戦闘開始。装備の消耗が増している。","color":"gray"}
execute as @e[type=minecraft:marker,tag=overlimit.cc_target,limit=1] at @s run function overlimit:city_clamp/spawn_burst
function overlimit:city_clamp/bossbar_name
function overlimit:city_clamp/bossbar_value
