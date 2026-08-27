scoreboard players set #cc_shul_done overlimit.const 1
execute unless block ~ ~ ~ #minecraft:replaceable run return fail
execute unless block ~ ~1 ~ #minecraft:replaceable run return fail
summon minecraft:shulker ~0.5 ~ ~0.5 {Tags:["overlimit.cc_wave","overlimit.cc_shulker","overlimit.cc_new"],PersistenceRequired:1b}
execute as @e[type=minecraft:shulker,tag=overlimit.cc_new,limit=1,distance=..4] at @s run function overlimit:city_clamp/mark_shulker
scoreboard players add #cc_shul_n overlimit.const 1
