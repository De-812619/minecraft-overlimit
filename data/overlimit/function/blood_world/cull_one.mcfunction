# @s = overlimit.blood_moon。at @s 前提。
# プレイヤー探索は predicate / in_bw タグを使わない（マルチで外れる）。
execute unless entity @s[tag=overlimit.bm_bw] run return fail
execute if entity @s[tag=overlimit.bm_ow] run return fail
execute store result score #bm_mx overlimit.const run data get entity @s Pos[0]
execute store result score #bm_my overlimit.const run data get entity @s Pos[1]
execute store result score #bm_mz overlimit.const run data get entity @s Pos[2]
scoreboard players set #bm_keep overlimit.const 0
execute as @a[gamemode=!spectator] at @s if dimension overlimit:blood_world run function overlimit:blood_moon/cull_check_player
execute if score #bm_keep overlimit.const matches 1 run return fail
function overlimit:blood_moon/cull_despawn
