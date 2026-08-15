bossbar set overlimit:blood_moon players @a[predicate=overlimit:in_overworld]
function overlimit:blood_moon/bossbar_value
function overlimit:blood_moon/bossbar_name

execute if score #bm_tod overlimit.const matches 23460.. run return run function overlimit:blood_moon/end_dawn
execute if score #bm_tod overlimit.const matches ..11999 run return run function overlimit:blood_moon/end_dawn

execute as @a[predicate=overlimit:in_overworld] if data entity @s SleepingX at @s run function overlimit:blood_moon/wake
