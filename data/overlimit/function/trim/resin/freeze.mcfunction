tag @s add overlimit.trim.look_stop
scoreboard players set @s overlimit.trim.look_linger 5
attribute @s minecraft:movement_speed modifier remove overlimit:trim.resin.look
attribute @s minecraft:movement_speed modifier add overlimit:trim.resin.look -1 add_multiplied_total
