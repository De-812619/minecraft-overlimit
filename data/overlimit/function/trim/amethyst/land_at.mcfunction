tag @s add overlimit.kb_center
execute as @e[type=#overlimit:hostile,tag=!overlimit.summon,distance=..3] at @s run function overlimit:enchant/util/knock_from_center
tag @s remove overlimit.kb_center
particle minecraft:gust ~ ~0.2 ~ 0.6 0.1 0.6 0 8
playsound minecraft:entity.wind_charge.wind_burst player @a ~ ~ ~ 0.5 1.4
