# End the short levitation pulse used for sky_walk hop.
scoreboard players remove @s overlimit.sky_lev 1
execute if score @s overlimit.sky_lev matches 0 run effect clear @s minecraft:levitation
