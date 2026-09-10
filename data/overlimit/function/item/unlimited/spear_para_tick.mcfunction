data modify entity @s Motion set value [0.0d, 0.0d, 0.0d]
scoreboard players remove @s overlimit.ul.para 1
execute if score @s overlimit.ul.para matches 1.. run return fail
function overlimit:item/unlimited/spear_unpara
