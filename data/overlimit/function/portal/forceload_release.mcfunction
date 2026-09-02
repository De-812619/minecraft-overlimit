execute unless score @s overlimit.pfl_dim matches 1.. run return fail
execute store result storage overlimit:portal pfl.x int 1 run scoreboard players get @s overlimit.pfl_x
execute store result storage overlimit:portal pfl.z int 1 run scoreboard players get @s overlimit.pfl_z
data modify storage overlimit:portal pfl.dim set value "minecraft:overworld"
execute if score @s overlimit.pfl_dim matches 2 run data modify storage overlimit:portal pfl.dim set value "overlimit:blood_world"
scoreboard players set @s overlimit.pfl_dim 0
function overlimit:portal/forceload_remove with storage overlimit:portal pfl
return 1
