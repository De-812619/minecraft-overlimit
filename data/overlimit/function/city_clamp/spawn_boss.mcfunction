execute if score #cc_boss overlimit.const matches 1 run return fail
scoreboard players set #cc_boss overlimit.const 1
execute as @e[type=minecraft:marker,tag=overlimit.cc_target,limit=1] at @s run summon minecraft:enderman ~ ~1 ~ {Tags:["overlimit.cc_wave","overlimit.cc_boss","overlimit.cc_new"],PersistenceRequired:1b}
execute as @e[type=minecraft:enderman,tag=overlimit.cc_boss,tag=overlimit.cc_new,limit=1] at @s run function overlimit:city_clamp/mark_boss
