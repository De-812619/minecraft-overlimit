execute store result storage overlimit:portal tp.x int 1 run data get entity @s Pos[0]
execute store result storage overlimit:portal tp.y int 1 run data get entity @s Pos[1]
execute store result storage overlimit:portal tp.z int 1 run data get entity @s Pos[2]
data modify storage overlimit:portal tp.dim set value "minecraft:overworld"
execute if predicate overlimit:in_blood_world run data modify storage overlimit:portal tp.dim set value "overlimit:blood_world"
function overlimit:portal/forceload_ensure
return 1
