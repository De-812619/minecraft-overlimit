$execute in overlimit:blood_world positioned $(x) 64 $(z) unless loaded ~ ~ ~ run forceload add ~-32 ~-32 ~32 ~32
$execute in overlimit:blood_world positioned $(x) 64 $(z) unless loaded ~ ~ ~ run return fail
$execute in overlimit:blood_world positioned $(x) $(y) $(z) if entity @e[type=minecraft:marker,tag=overlimit.bw_portal,distance=..48] run return fail
function overlimit:portal/gate_lost
