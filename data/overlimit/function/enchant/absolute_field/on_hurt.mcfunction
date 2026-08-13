# @s = hurt player (absolute_field wearer). CD 5s = 100 ticks. r=3 knockback, no damage.
execute if score @s overlimit.cd.absolute matches 1.. run return fail
scoreboard players set @s overlimit.cd.absolute 100
tag @s add overlimit.kb_center
execute as @e[type=#overlimit:hostile,distance=..3] at @s run function overlimit:enchant/absolute_field/knock
tag @s remove overlimit.kb_center
particle minecraft:gust_emitter_small ~ ~1 ~ 0 0 0 0 1
playsound minecraft:entity.wind_charge.wind_burst player @a ~ ~ ~ 0.8 1
