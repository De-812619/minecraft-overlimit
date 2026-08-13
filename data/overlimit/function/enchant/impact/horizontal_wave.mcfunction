# At hit-block top, facing horizontal. Damage + knock + sonic boom along ground.
playsound minecraft:entity.warden.sonic_boom player @a ~ ~ ~ 1 1
playsound minecraft:entity.warden.attack player @a ~ ~ ~ 0.7 0.8

execute positioned ^ ^ ^2 run particle minecraft:sonic_boom ~ ~ ~ 0 0 0 0 1 force
execute positioned ^ ^ ^4 run particle minecraft:sonic_boom ~ ~ ~ 0 0 0 0 1 force
execute positioned ^ ^ ^6 run particle minecraft:sonic_boom ~ ~ ~ 0 0 0 0 1 force
execute positioned ^ ^ ^8 run particle minecraft:sonic_boom ~ ~ ~ 0 0 0 0 1 force
execute positioned ^ ^ ^10 run particle minecraft:sonic_boom ~ ~ ~ 0 0 0 0 1 force
execute positioned ^ ^ ^12 run particle minecraft:sonic_boom ~ ~ ~ 0 0 0 0 1 force
execute positioned ^ ^ ^14 run particle minecraft:sonic_boom ~ ~ ~ 0 0 0 0 1 force
execute positioned ^ ^ ^16 run particle minecraft:sonic_boom ~ ~ ~ 0 0 0 0 1 force
execute positioned ^ ^ ^8 run particle minecraft:sculk_soul ~ ~ ~ 1.0 0.15 1.0 0.02 16 force

execute positioned ^ ^ ^1 as @e[type=#overlimit:hostile,distance=..2.8] run tag @s add overlimit.impact_hit
execute positioned ^ ^ ^4 as @e[type=#overlimit:hostile,distance=..2.8] run tag @s add overlimit.impact_hit
execute positioned ^ ^ ^7 as @e[type=#overlimit:hostile,distance=..2.8] run tag @s add overlimit.impact_hit
execute positioned ^ ^ ^10 as @e[type=#overlimit:hostile,distance=..2.8] run tag @s add overlimit.impact_hit
execute positioned ^ ^ ^13 as @e[type=#overlimit:hostile,distance=..2.8] run tag @s add overlimit.impact_hit
execute positioned ^ ^ ^16 as @e[type=#overlimit:hostile,distance=..2.8] run tag @s add overlimit.impact_hit

execute as @e[tag=overlimit.impact_hit] run damage @s 16 minecraft:sonic_boom by @p[tag=overlimit.impact_attacker]
execute as @e[tag=overlimit.impact_hit] at @s run function overlimit:enchant/impact/knock
tag @e[tag=overlimit.impact_hit] remove overlimit.impact_hit
