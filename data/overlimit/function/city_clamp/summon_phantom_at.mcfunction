summon minecraft:phantom ~0.5 ~ ~0.5 {Tags:["overlimit.cc_wave","overlimit.cc_new"],PersistenceRequired:1b}
execute as @e[type=minecraft:phantom,tag=overlimit.cc_new,limit=1,distance=..4] at @s run function overlimit:city_clamp/mark_mob
scoreboard players add #cc_spawned overlimit.const 1
