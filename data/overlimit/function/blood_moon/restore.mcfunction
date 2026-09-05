# /reload 中にイベントが続いていた場合の霧・ボスバー復旧
function overlimit:blood_moon/fog_on
function overlimit:blood_moon/spawn_monsters_off
function overlimit:blood_moon/weather_clear
function overlimit:blood_moon/read_time
function overlimit:blood_moon/bossbar_name
function overlimit:blood_moon/bossbar_value
bossbar set overlimit:blood_moon color red
execute store result bossbar overlimit:blood_moon max run scoreboard players get #11460 overlimit.const
bossbar set overlimit:blood_moon style progress
bossbar set overlimit:blood_moon visible true
bossbar set overlimit:blood_moon players @a[predicate=overlimit:in_overworld]
