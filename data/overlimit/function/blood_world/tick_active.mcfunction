# 朝判定より先に撃破点を確定する（100体と朝が同tickだと報酬が落ちる）
function overlimit:blood_world/credit_pending
execute as @e[tag=overlimit.blood_moon,tag=!overlimit.bm_scored] run function overlimit:blood_world/credit_if_dead
execute unless score #bw_active overlimit.const matches 1 run return fail

bossbar set overlimit:blood_world players @a[tag=overlimit.in_bw]
function overlimit:blood_world/bossbar_value
function overlimit:blood_world/bossbar_name

execute if score #bw_kills overlimit.const matches 100.. run return run function overlimit:blood_world/end_victory
execute unless entity @a[tag=overlimit.in_bw,gamemode=!spectator] run return run function overlimit:blood_world/end_empty
execute if score #bw_tod overlimit.const matches 23460.. run return run function overlimit:blood_world/end_dawn
execute if score #bw_tod overlimit.const matches ..11999 run return run function overlimit:blood_world/end_dawn

execute as @a[tag=overlimit.in_bw] if data entity @s SleepingX at @s run function overlimit:blood_moon/wake

execute as @e[tag=overlimit.blood_moon,tag=overlimit.crisis,tag=!overlimit.bm_crisis] run tag @s add overlimit.bm_crisis
execute as @e[tag=overlimit.blood_moon,tag=overlimit.disaster,tag=!overlimit.bm_disaster] run tag @s add overlimit.bm_disaster
execute as @e[tag=overlimit.blood_moon,tag=!overlimit.crisis,tag=!overlimit.disaster,tag=!overlimit.bm_normal] run tag @s add overlimit.bm_normal

scoreboard players add #bw_spawn_t overlimit.const 1
execute if score #bw_spawn_t overlimit.const >= #bm_spawn_int overlimit.const run function overlimit:blood_world/spawn_pulse
