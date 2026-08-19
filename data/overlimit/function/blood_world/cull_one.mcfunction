# @s = overlimit.blood_moon。25マス以内かつ高さ±8のプレイヤーがいれば残す。
execute unless entity @a[tag=overlimit.in_bw,gamemode=!spectator,distance=..25] run return run function overlimit:blood_moon/cull_despawn

scoreboard players set #bm_keep overlimit.const 0
execute store result score #bm_my overlimit.const run data get entity @s Pos[1]
execute as @a[tag=overlimit.in_bw,gamemode=!spectator,distance=..25] run function overlimit:blood_moon/cull_check_y
execute if score #bm_keep overlimit.const matches 1 run return fail
function overlimit:blood_moon/cull_despawn
