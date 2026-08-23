execute as @e[type=minecraft:marker,tag=overlimit.no_gate] at @s run function overlimit:nether_overflow/remember_gate
tag @e[type=minecraft:marker,tag=overlimit.no_gate] remove overlimit.no_target
tag @e[type=minecraft:marker,tag=overlimit.no_gate] remove overlimit.no_best
scoreboard players set #no_best overlimit.const 2147483647
scoreboard players set #no_picked overlimit.const 0
execute unless data storage overlimit:no gates[0] run return fail
data modify storage overlimit:no pick set from storage overlimit:no gates
function overlimit:nether_overflow/pick_loop
execute unless score #no_picked overlimit.const matches 1 run return fail
