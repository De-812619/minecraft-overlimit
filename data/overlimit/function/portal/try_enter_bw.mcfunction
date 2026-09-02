execute store result storage overlimit:portal tp.x int 1 run scoreboard players get @s overlimit.bwx
execute store result storage overlimit:portal tp.y int 1 run scoreboard players get @s overlimit.bwy
execute store result storage overlimit:portal tp.z int 1 run scoreboard players get @s overlimit.bwz
data modify storage overlimit:portal tp.dim set value "overlimit:blood_world"
return run function overlimit:portal/try_enter_at with storage overlimit:portal tp
