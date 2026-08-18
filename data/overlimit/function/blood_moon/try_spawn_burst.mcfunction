# @s = player, at player. 12/16 の10方向を高さマップへ召喚する（プレイヤー高さ±4のみ）。
execute if biome ~ ~ ~ minecraft:deep_dark run return fail
execute store result score #bm_py overlimit.const run data get entity @s Pos[1]

scoreboard players set #bm_wave overlimit.const 0
execute positioned ~12 ~ ~ run function overlimit:blood_moon/burst_try
execute positioned ~-12 ~ ~ run function overlimit:blood_moon/burst_try
execute positioned ~ ~ ~12 run function overlimit:blood_moon/burst_try
execute positioned ~ ~ ~-12 run function overlimit:blood_moon/burst_try
execute positioned ~8 ~ ~8 run function overlimit:blood_moon/burst_try
execute positioned ~-8 ~ ~8 run function overlimit:blood_moon/burst_try
execute positioned ~8 ~ ~-8 run function overlimit:blood_moon/burst_try
execute positioned ~-8 ~ ~-8 run function overlimit:blood_moon/burst_try
execute positioned ~16 ~ ~ run function overlimit:blood_moon/burst_try
execute positioned ~-16 ~ ~ run function overlimit:blood_moon/burst_try

execute if score #bm_wave overlimit.const < #bm_spawn_burst overlimit.const positioned ~12 ~ ~ run function overlimit:blood_moon/burst_fallback
execute if score #bm_wave overlimit.const < #bm_spawn_burst overlimit.const positioned ~-12 ~ ~ run function overlimit:blood_moon/burst_fallback
execute if score #bm_wave overlimit.const < #bm_spawn_burst overlimit.const positioned ~ ~ ~12 run function overlimit:blood_moon/burst_fallback
execute if score #bm_wave overlimit.const < #bm_spawn_burst overlimit.const positioned ~ ~ ~-12 run function overlimit:blood_moon/burst_fallback
execute if score #bm_wave overlimit.const < #bm_spawn_burst overlimit.const positioned ~10 ~ ~10 run function overlimit:blood_moon/burst_fallback
execute if score #bm_wave overlimit.const < #bm_spawn_burst overlimit.const positioned ~-10 ~ ~10 run function overlimit:blood_moon/burst_fallback
execute if score #bm_wave overlimit.const < #bm_spawn_burst overlimit.const positioned ~10 ~ ~-10 run function overlimit:blood_moon/burst_fallback
execute if score #bm_wave overlimit.const < #bm_spawn_burst overlimit.const positioned ~-10 ~ ~-10 run function overlimit:blood_moon/burst_fallback
execute if score #bm_wave overlimit.const < #bm_spawn_burst overlimit.const positioned ~16 ~ ~ run function overlimit:blood_moon/burst_fallback
execute if score #bm_wave overlimit.const < #bm_spawn_burst overlimit.const positioned ~ ~ ~16 run function overlimit:blood_moon/burst_fallback
tellraw @s [{"text":"[overlimit] 開始スポーン ","color":"gray"},{"score":{"name":"#bm_wave","objective":"overlimit.const"}},{"text":"体"}]
