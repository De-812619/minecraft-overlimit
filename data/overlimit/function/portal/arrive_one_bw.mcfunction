execute if score #bw_gate overlimit.const matches 1 run return run function overlimit:portal/arrive_join_gate
execute unless loaded ~ ~ ~ run forceload add ~-32 ~-32 ~32 ~32
execute unless loaded ~ ~ ~ run return fail
execute if entity @e[type=minecraft:marker,tag=overlimit.bw_portal,distance=..48] run function overlimit:portal/stand_front
execute if entity @e[type=minecraft:marker,tag=overlimit.bw_portal,distance=..48] run return run function overlimit:portal/arrive_done
return run function overlimit:portal/land_here
