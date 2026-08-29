execute store result storage overlimit:portal tp.x int 1 run scoreboard players get @s overlimit.owx
execute store result storage overlimit:portal tp.y int 1 run scoreboard players get @s overlimit.owy
execute store result storage overlimit:portal tp.z int 1 run scoreboard players get @s overlimit.owz
data modify storage overlimit:portal tp.dim set value "minecraft:overworld"
function overlimit:portal/tp_to with storage overlimit:portal tp
