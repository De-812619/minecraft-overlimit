execute store result score #pfl_x overlimit.const run data get storage overlimit:portal tp.x
execute store result score #pfl_z overlimit.const run data get storage overlimit:portal tp.z
scoreboard players set #pfl_dim overlimit.const 0
execute if data storage overlimit:portal tp{dim:"minecraft:overworld"} run scoreboard players set #pfl_dim overlimit.const 1
execute if data storage overlimit:portal tp{dim:"overlimit:blood_world"} run scoreboard players set #pfl_dim overlimit.const 2
execute unless score #pfl_dim overlimit.const matches 1.. run return fail
execute if score @s overlimit.pfl_dim = #pfl_dim overlimit.const if score @s overlimit.pfl_x = #pfl_x overlimit.const if score @s overlimit.pfl_z = #pfl_z overlimit.const if score @s overlimit.pfl_dim matches 1.. run return fail
execute if score @s overlimit.pfl_dim matches 1.. run function overlimit:portal/forceload_release
scoreboard players operation @s overlimit.pfl_x = #pfl_x overlimit.const
scoreboard players operation @s overlimit.pfl_z = #pfl_z overlimit.const
scoreboard players operation @s overlimit.pfl_dim = #pfl_dim overlimit.const
function overlimit:portal/forceload_at with storage overlimit:portal tp
return 1
