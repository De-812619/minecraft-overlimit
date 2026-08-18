bossbar set overlimit:blood_moon players @a[predicate=overlimit:in_overworld]
function overlimit:blood_moon/bossbar_value
function overlimit:blood_moon/bossbar_name

execute if score #bm_kills overlimit.const matches 100.. run return run function overlimit:blood_moon/end_victory
execute if score #bm_tod overlimit.const matches 23460.. run return run function overlimit:blood_moon/end_dawn
execute if score #bm_tod overlimit.const matches ..11999 run return run function overlimit:blood_moon/end_dawn

execute as @a[predicate=overlimit:in_overworld] if data entity @s SleepingX at @s run function overlimit:blood_moon/wake

execute as @e[tag=overlimit.blood_moon,tag=overlimit.crisis,tag=!overlimit.bm_crisis] run tag @s add overlimit.bm_crisis
execute as @e[tag=overlimit.blood_moon,tag=!overlimit.crisis,tag=!overlimit.bm_normal] run tag @s add overlimit.bm_normal

scoreboard players add #bm_spawn_t overlimit.const 1
execute if score #bm_spawn_t overlimit.const >= #bm_spawn_int overlimit.const run function overlimit:blood_moon/spawn_pulse
