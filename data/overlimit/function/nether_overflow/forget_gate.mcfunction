data modify storage overlimit:no cand set value {x:0,y:0,z:0}
execute store result storage overlimit:no cand.x int 1 run data get entity @s Pos[0]
execute store result storage overlimit:no cand.y int 1 run data get entity @s Pos[1]
execute store result storage overlimit:no cand.z int 1 run data get entity @s Pos[2]
data modify storage overlimit:no keep set value []
data modify storage overlimit:no chk set from storage overlimit:no gates
function overlimit:nether_overflow/forget_loop
data modify storage overlimit:no gates set from storage overlimit:no keep
