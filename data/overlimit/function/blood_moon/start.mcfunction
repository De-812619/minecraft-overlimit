scoreboard players set #bm_active overlimit.const 1
scoreboard players set #bm_kills overlimit.const 0
scoreboard players operation #bm_chance overlimit.const = #bm_chance_base overlimit.const

function overlimit:blood_moon/fog_on
execute in minecraft:overworld run weather clear 14000
function overlimit:blood_moon/read_time
function overlimit:blood_moon/bossbar_name
function overlimit:blood_moon/bossbar_value

bossbar set overlimit:blood_moon color red
execute store result bossbar overlimit:blood_moon max run scoreboard players get #11460 overlimit.const
bossbar set overlimit:blood_moon style progress
bossbar set overlimit:blood_moon visible true
bossbar set overlimit:blood_moon players @a[predicate=overlimit:in_overworld]

title @a[predicate=overlimit:in_overworld] times 10 70 20
title @a[predicate=overlimit:in_overworld] title {"text":"ブラッドムーン","color":"dark_red","bold":true}
execute as @a[predicate=overlimit:in_overworld] at @s run playsound minecraft:entity.wither.spawn player @s ~ ~ ~ 0.45 0.55
tellraw @a[predicate=overlimit:in_overworld] [{"text":"ブラッドムーンが始まった。この夜は強化された敵だけが現れる。100体倒せ。","color":"red"},{"text":" （ヒート ","color":"gold"},{"score":{"name":"#heat","objective":"overlimit.const"},"color":"gold"},{"text":"）","color":"gold"}]

scoreboard players set #bm_spawn_t overlimit.const 0
function overlimit:blood_moon/spawn_burst
function overlimit:blood_moon/spawn_monsters_off
function overlimit:blood_moon/convert_unnamed
