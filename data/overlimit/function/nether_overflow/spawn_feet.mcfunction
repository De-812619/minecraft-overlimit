# 実行位置 = 立てる空気（足元）。門Y±4 のみ。成功したら return 1。
execute unless loaded ~ ~ ~ run return fail
function overlimit:nether_overflow/read_gate_scores

summon minecraft:marker ~ ~ ~ {Tags:["overlimit.no_yh"]}
execute store result score #no_coly overlimit.const run data get entity @n[type=minecraft:marker,tag=overlimit.no_yh] Pos[1]
kill @e[type=minecraft:marker,tag=overlimit.no_yh,distance=..1]
scoreboard players operation #no_dy overlimit.const = #no_coly overlimit.const
scoreboard players operation #no_dy overlimit.const -= #no_gy overlimit.const
execute if score #no_dy overlimit.const matches 5.. run return fail
execute if score #no_dy overlimit.const matches ..-5 run return fail
execute if score #no_spawned overlimit.const >= #no_budget overlimit.const run return fail

execute if block ~ ~ ~ minecraft:nether_portal run return fail
execute if block ~ ~1 ~ minecraft:nether_portal run return fail

scoreboard players operation #no_pre overlimit.const = #no_spawned overlimit.const
execute store result score #no_kind overlimit.const run random value 0..99
execute if score #no_kind overlimit.const matches 0..74 run function overlimit:nether_overflow/summon_piglin
execute if score #no_kind overlimit.const matches 75..99 run function overlimit:nether_overflow/summon_brute
execute if score #no_spawned overlimit.const > #no_pre overlimit.const run return 1
return fail
