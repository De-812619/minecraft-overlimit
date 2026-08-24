# 朝判定より先に撃破点を確定する（100体と朝が同tickだと報酬が落ちる）
function overlimit:blood_moon/credit_pending
execute as @e[tag=overlimit.blood_moon,tag=!overlimit.bm_scored] run function overlimit:blood_moon/credit_if_dead
execute unless score #bm_active overlimit.const matches 1 run return fail

bossbar set overlimit:blood_moon players @a[predicate=overlimit:in_overworld]
function overlimit:blood_moon/bossbar_value
function overlimit:blood_moon/bossbar_name

execute if score #bm_kills overlimit.const matches 100.. run return run function overlimit:blood_moon/end_victory
execute if score #bm_tod overlimit.const matches 23460.. run return run function overlimit:blood_moon/end_dawn
execute if score #bm_tod overlimit.const matches ..11999 run return run function overlimit:blood_moon/end_dawn

execute as @a[predicate=overlimit:in_overworld] if data entity @s SleepingX at @s run function overlimit:blood_moon/wake

execute as @e[tag=overlimit.blood_moon,tag=overlimit.crisis,tag=!overlimit.bm_crisis] run tag @s add overlimit.bm_crisis
execute as @e[tag=overlimit.blood_moon,tag=overlimit.disaster,tag=!overlimit.bm_disaster] run tag @s add overlimit.bm_disaster
execute as @e[tag=overlimit.blood_moon,tag=!overlimit.crisis,tag=!overlimit.disaster,tag=!overlimit.bm_normal] run tag @s add overlimit.bm_normal

scoreboard players add #bm_spawn_t overlimit.const 1
execute if score #bm_spawn_t overlimit.const >= #bm_spawn_int overlimit.const run function overlimit:blood_moon/spawn_pulse
