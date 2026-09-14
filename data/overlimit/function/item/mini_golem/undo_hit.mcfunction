execute unless score @s overlimit.golem_hp matches 1.. run return fail
execute store result entity @s Health float 0.1 run scoreboard players get @s overlimit.golem_hp
data modify entity @s HurtTime set value 0s
data modify entity @s Motion set value [0.0d, 0.0d, 0.0d]
