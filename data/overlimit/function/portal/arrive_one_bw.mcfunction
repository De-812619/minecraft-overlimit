execute if score #bw_gate overlimit.const matches 1 run return run function overlimit:portal/arrive_join_gate
execute unless loaded ~ ~ ~ run forceload add ~-48 ~-48 ~48 ~48
execute unless loaded ~ ~ ~ run return fail
execute unless entity @e[type=minecraft:marker,tag=overlimit.bw_fl,distance=..4] run summon minecraft:marker ~ ~ ~ {Tags:["overlimit.bw_fl"]}
execute if function overlimit:portal/ensure run return run function overlimit:portal/arrive_done
execute if data storage overlimit:portal origin.x run function overlimit:portal/spread_to_land with storage overlimit:portal origin
