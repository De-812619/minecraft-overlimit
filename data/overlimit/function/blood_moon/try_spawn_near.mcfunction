# @s = player, at player. 8方向×12/16 の地表へ1回試す。
execute store result score #bm_alive overlimit.const if entity @e[tag=overlimit.blood_moon]
execute if score #bm_alive overlimit.const >= #bm_spawn_cap overlimit.const run return fail

execute store result score #bm_near overlimit.const if entity @e[tag=overlimit.blood_moon,distance=..48]
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
