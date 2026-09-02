execute unless block ~ ~ ~ #minecraft:replaceable run return fail
execute unless block ~ ~1 ~ #minecraft:replaceable run return fail
execute if block ~ ~ ~ minecraft:nether_portal run return fail
execute if block ~ ~1 ~ minecraft:nether_portal run return fail
summon minecraft:piglin ~0.5 ~ ~0.5 {Tags:["overlimit.no_wave","overlimit.no_new"],IsImmuneToZombification:1b,PersistenceRequired:1b,CanPickUpLoot:0b}
execute as @e[type=minecraft:piglin,tag=overlimit.no_new,limit=1,distance=..4] at @s run function overlimit:nether_overflow/mark_piglin
scoreboard players add #no_spawned overlimit.const 1
