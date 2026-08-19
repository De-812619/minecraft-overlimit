scoreboard players set #bw_active overlimit.const 1
scoreboard players set #bw_kills overlimit.const 0

function overlimit:blood_world/fog_on
function overlimit:blood_moon/read_time
function overlimit:blood_world/bossbar_name
function overlimit:blood_world/bossbar_value

bossbar set overlimit:blood_world color red
execute store result bossbar overlimit:blood_world max run scoreboard players get #11460 overlimit.const
bossbar set overlimit:blood_world style progress
bossbar set overlimit:blood_world visible true
bossbar set overlimit:blood_world players @a[tag=overlimit.in_bw]

title @a[tag=overlimit.in_bw] times 10 70 20
title @a[tag=overlimit.in_bw] title {"text":"ブラッドムーン","color":"dark_red","bold":true}
execute as @a[tag=overlimit.in_bw] at @s run playsound minecraft:entity.wither.spawn player @s ~ ~ ~ 0.45 0.55
tellraw @a[tag=overlimit.in_bw] {"text":"ブラッドムーンが始まった。強化された敵を100体倒せ。","color":"red"}

scoreboard players set #bw_spawn_t overlimit.const 0
function overlimit:blood_world/spawn_burst
function overlimit:blood_world/convert_unnamed
