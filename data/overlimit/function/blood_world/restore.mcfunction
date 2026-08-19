# /reload 中にイベントが続いていた場合の霧・ボスバー復旧
function overlimit:blood_world/fog_on
execute in overlimit:blood_world run function overlimit:blood_moon/read_time
function overlimit:blood_world/bossbar_name
function overlimit:blood_world/bossbar_value
bossbar set overlimit:blood_world color red
execute store result bossbar overlimit:blood_world max run scoreboard players get #11460 overlimit.const
bossbar set overlimit:blood_world style progress
bossbar set overlimit:blood_world visible true
bossbar set overlimit:blood_world players @a[tag=overlimit.in_bw]
