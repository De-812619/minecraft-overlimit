scoreboard players remove @s overlimit.bind.timer 1
data modify entity @s Motion set value [0.0d, 0.0d, 0.0d]
execute if score @s overlimit.bind.timer matches 1.. run return fail
tag @s remove overlimit.bound
scoreboard players reset @s overlimit.bind.timer
