scoreboard players remove @s overlimit.sky_plat_life 1
execute if score @s overlimit.sky_plat_life matches 1.. run return fail
function overlimit:enchant/sky_walk/clear_plat
