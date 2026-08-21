data modify storage overlimit:recall dim set value "minecraft:overworld"
data modify storage overlimit:recall dim set from entity @s respawn.dimension
execute store result storage overlimit:recall x int 1 run data get entity @s respawn.pos[0]
execute store result storage overlimit:recall y int 1 run data get entity @s respawn.pos[1]
execute store result storage overlimit:recall z int 1 run data get entity @s respawn.pos[2]
function overlimit:item/recall_watch/tp with storage overlimit:recall
