# 候補地点。スキャンはブラッドムーン用を直接かけて通常個体にしない。
execute if block ~ ~ ~ minecraft:water run return run function overlimit:blood_moon/summon_drowned
execute if block ~ ~1 ~ minecraft:water run return run function overlimit:blood_moon/summon_drowned

execute store result score #bm_kind overlimit.const run random value 0..99
execute if score #bm_kind overlimit.const matches 0..39 run summon minecraft:zombie ~ ~ ~ {Tags:["overlimit.bm_wave"]}
execute if score #bm_kind overlimit.const matches 40..64 run summon minecraft:skeleton ~ ~ ~ {Tags:["overlimit.bm_wave"]}
execute if score #bm_kind overlimit.const matches 65..84 run summon minecraft:spider ~ ~ ~ {Tags:["overlimit.bm_wave"]}
execute if score #bm_kind overlimit.const matches 85..96 run summon minecraft:creeper ~ ~ ~ {Tags:["overlimit.bm_wave"]}
execute if score #bm_kind overlimit.const matches 97..99 run summon minecraft:witch ~ ~ ~ {Tags:["overlimit.bm_wave"]}

execute as @n[tag=overlimit.bm_wave,tag=!overlimit.scanned,distance=..4] run function overlimit:mob/scan_blood_moon
execute if entity @e[tag=overlimit.bm_wave,distance=..4,limit=1] run scoreboard players set #bm_spawned overlimit.const 1
