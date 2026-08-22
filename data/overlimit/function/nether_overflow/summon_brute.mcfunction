execute unless block ~ ~ ~ #minecraft:replaceable run return fail
execute unless block ~ ~1 ~ #minecraft:replaceable run return fail
summon minecraft:piglin_brute ~0.5 ~ ~0.5 {Tags:["overlimit.no_wave","overlimit.no_new"],IsImmuneToZombification:1b,PersistenceRequired:1b}
execute as @e[type=minecraft:piglin_brute,tag=overlimit.no_new,limit=1,distance=..4] run function overlimit:nether_overflow/mark_piglin
scoreboard players add #no_spawned overlimit.const 1
