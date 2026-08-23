execute if entity @e[type=minecraft:marker,tag=overlimit.no_target,distance=..64] run return fail
execute if entity @a[predicate=overlimit:in_overworld,gamemode=!spectator,gamemode=!creative,distance=..64] run return fail
function overlimit:blood_moon/despawn_one
