execute if entity @s[tag=overlimit.no_stored] run return fail
data modify storage overlimit:no cand set value {x:0,y:0,z:0,gfail:0}
execute store result storage overlimit:no cand.x int 1 run data get entity @s Pos[0]
execute store result storage overlimit:no cand.y int 1 run data get entity @s Pos[1]
execute store result storage overlimit:no cand.z int 1 run data get entity @s Pos[2]
execute store result storage overlimit:no cand.gfail int 1 run scoreboard players get @s overlimit.no_gfail
scoreboard players set #no_dup overlimit.const 0
data modify storage overlimit:no chk set from storage overlimit:no gates
function overlimit:nether_overflow/remember_chk
execute if score #no_dup overlimit.const matches 0 run data modify storage overlimit:no gates append from storage overlimit:no cand
tag @s add overlimit.no_stored
