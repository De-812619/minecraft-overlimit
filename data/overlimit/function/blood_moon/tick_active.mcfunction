# 朝判定より先に撃破点を確定する（100体と朝が同tickだと報酬が落ちる）
function overlimit:blood_moon/credit_pending
overlimit event_mobs ow_credit
execute unless score #bm_active overlimit.const matches 1 run return fail

function overlimit:blood_moon/weather_clear

bossbar set overlimit:blood_moon players @a[predicate=overlimit:in_overworld]
function overlimit:blood_moon/bossbar_value
function overlimit:blood_moon/bossbar_name

execute if score #bm_kills overlimit.const matches 100.. run return run function overlimit:blood_moon/end_victory
execute if score #bm_tod overlimit.const matches 23460.. run return run function overlimit:blood_moon/end_dawn
execute if score #bm_tod overlimit.const matches ..11999 run return run function overlimit:blood_moon/end_dawn

execute as @a[predicate=overlimit:in_overworld] if data entity @s SleepingX at @s run function overlimit:blood_moon/wake

overlimit event_mobs ow_ranks

scoreboard players add #bm_spawn_t overlimit.const 1
execute if score #bm_spawn_t overlimit.const >= #bm_spawn_int overlimit.const run function overlimit:blood_moon/spawn_pulse
