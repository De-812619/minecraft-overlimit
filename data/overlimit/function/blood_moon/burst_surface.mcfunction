# @s = player. 実行位置 = その列の地表。谷底へ落とさない・顔の前には出さない。
execute unless loaded ~ ~ ~ run return fail
execute if entity @a[distance=..5] run return fail
execute unless entity @s[distance=..48] run return fail
execute unless predicate overlimit:blood_moon_dark_spawn run return fail

summon minecraft:marker ~ ~ ~ {Tags:["overlimit.bm_yh"]}
execute store result score #bm_y overlimit.const run data get entity @n[type=minecraft:marker,tag=overlimit.bm_yh] Pos[1]
kill @e[type=minecraft:marker,tag=overlimit.bm_yh,distance=..1]
scoreboard players operation #bm_dy overlimit.const = #bm_py overlimit.const
scoreboard players operation #bm_dy overlimit.const -= #bm_y overlimit.const
execute if score #bm_dy overlimit.const matches 13.. run return fail

scoreboard players set #bm_spawned overlimit.const 0
function overlimit:blood_moon/summon_one
execute if score #bm_spawned overlimit.const matches 1 run scoreboard players add #bm_wave overlimit.const 1
