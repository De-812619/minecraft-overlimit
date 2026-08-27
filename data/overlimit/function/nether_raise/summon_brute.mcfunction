execute unless block ~ ~ ~ #minecraft:replaceable run return fail
execute unless block ~ ~1 ~ #minecraft:replaceable run return fail
summon minecraft:piglin_brute ~0.5 ~ ~0.5 {Tags:["overlimit.nr_wave","overlimit.nr_new"],IsImmuneToZombification:1b,PersistenceRequired:1b}
execute as @e[type=minecraft:piglin_brute,tag=overlimit.nr_new,limit=1,distance=..4] at @s run function overlimit:nether_raise/mark_mob
scoreboard players add #nr_spawned overlimit.const 1
