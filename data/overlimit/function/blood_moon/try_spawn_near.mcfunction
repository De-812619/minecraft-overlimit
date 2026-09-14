# @s = player, at player. 12/16 の地表（プレイヤー高さ±4）へ1回試す。
# 個体数は OW/BW の所属タグで数える（if dimension は実行次元を見る）。
scoreboard players set #bm_alive overlimit.const 0
execute if entity @s[tag=overlimit.in_bw] as @e[tag=overlimit.blood_moon,tag=overlimit.bm_bw] run scoreboard players add #bm_alive overlimit.const 1
execute if entity @s[tag=!overlimit.in_bw] as @e[tag=overlimit.blood_moon,tag=overlimit.bm_ow] run scoreboard players add #bm_alive overlimit.const 1
execute if score #bm_alive overlimit.const >= #bm_spawn_cap overlimit.const run return fail

scoreboard players set #bm_near overlimit.const 0
execute if entity @s[tag=overlimit.in_bw] as @e[tag=overlimit.blood_moon,tag=overlimit.bm_bw,distance=..48] run scoreboard players add #bm_near overlimit.const 1
execute if entity @s[tag=!overlimit.in_bw] as @e[tag=overlimit.blood_moon,tag=overlimit.bm_ow,distance=..48] run scoreboard players add #bm_near overlimit.const 1
execute if score #bm_near overlimit.const >= #bm_spawn_near overlimit.const run return fail

execute store result score #bm_slot overlimit.const run random value 0..15
execute if score #bm_slot overlimit.const matches 0 positioned ~12 ~ ~ run return run function overlimit:blood_moon/burst_try
execute if score #bm_slot overlimit.const matches 1 positioned ~8 ~ ~8 run return run function overlimit:blood_moon/burst_try
execute if score #bm_slot overlimit.const matches 2 positioned ~ ~ ~12 run return run function overlimit:blood_moon/burst_try
execute if score #bm_slot overlimit.const matches 3 positioned ~-8 ~ ~8 run return run function overlimit:blood_moon/burst_try
execute if score #bm_slot overlimit.const matches 4 positioned ~-12 ~ ~ run return run function overlimit:blood_moon/burst_try
execute if score #bm_slot overlimit.const matches 5 positioned ~-8 ~ ~-8 run return run function overlimit:blood_moon/burst_try
execute if score #bm_slot overlimit.const matches 6 positioned ~ ~ ~-12 run return run function overlimit:blood_moon/burst_try
execute if score #bm_slot overlimit.const matches 7 positioned ~8 ~ ~-8 run return run function overlimit:blood_moon/burst_try
execute if score #bm_slot overlimit.const matches 8 positioned ~16 ~ ~ run return run function overlimit:blood_moon/burst_try
execute if score #bm_slot overlimit.const matches 9 positioned ~11 ~ ~11 run return run function overlimit:blood_moon/burst_try
execute if score #bm_slot overlimit.const matches 10 positioned ~ ~ ~16 run return run function overlimit:blood_moon/burst_try
execute if score #bm_slot overlimit.const matches 11 positioned ~-11 ~ ~11 run return run function overlimit:blood_moon/burst_try
execute if score #bm_slot overlimit.const matches 12 positioned ~-16 ~ ~ run return run function overlimit:blood_moon/burst_try
execute if score #bm_slot overlimit.const matches 13 positioned ~-11 ~ ~-11 run return run function overlimit:blood_moon/burst_try
execute if score #bm_slot overlimit.const matches 14 positioned ~ ~ ~-16 run return run function overlimit:blood_moon/burst_try
execute if score #bm_slot overlimit.const matches 15 positioned ~11 ~ ~-11 run return run function overlimit:blood_moon/burst_try
