scoreboard players remove @s overlimit.trim.look_linger 2
execute if score @s overlimit.trim.look_linger matches 1.. run return fail
attribute @s minecraft:movement_speed modifier remove overlimit:trim.resin.look
tag @s remove overlimit.trim.look_stop
scoreboard players reset @s overlimit.trim.look_linger
