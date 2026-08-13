scoreboard players set @s overlimit.bind.timer 60
effect give @s minecraft:slowness 3 255 true
effect give @s minecraft:glowing 3 0 true
data modify entity @s Motion set value [0.0d, 0.0d, 0.0d]
tag @s add overlimit.bound
particle minecraft:snowflake ~ ~1 ~ 0.4 0.6 0.4 0.01 20
