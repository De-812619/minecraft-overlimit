execute unless loaded ~ ~ ~ run return fail
summon minecraft:marker ~ ~ ~ {Tags:["overlimit.no_yh"]}
execute store result score #no_coly overlimit.const run data get entity @n[type=minecraft:marker,tag=overlimit.no_yh] Pos[1]
kill @e[type=minecraft:marker,tag=overlimit.no_yh,distance=..1]
scoreboard players operation #no_dy overlimit.const = #no_coly overlimit.const
scoreboard players operation #no_dy overlimit.const -= #no_gy overlimit.const
execute if score #no_dy overlimit.const matches 5.. run return fail
execute if score #no_dy overlimit.const matches ..-5 run return fail
execute if score #no_spawned overlimit.const >= #no_budget overlimit.const run return fail

execute store result score #no_kind overlimit.const run random value 0..99
execute if score #no_kind overlimit.const matches 0..74 positioned ~ ~1 ~ run function overlimit:nether_overflow/summon_piglin
execute if score #no_kind overlimit.const matches 75..99 positioned ~ ~1 ~ run function overlimit:nether_overflow/summon_brute
