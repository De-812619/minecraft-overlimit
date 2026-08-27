execute if entity @e[type=minecraft:marker,tag=overlimit.cc_target,distance=..24] run return fail
scoreboard players set #cc_near_lim overlimit.const 32
scoreboard players set #cc_near_p overlimit.const 0
execute store result score #cc_cx overlimit.const run data get entity @s Pos[0]
execute store result score #cc_cz overlimit.const run data get entity @s Pos[2]
execute as @a[predicate=overlimit:in_the_end,gamemode=!spectator,gamemode=!creative,distance=..48] run function overlimit:city_clamp/near_one
execute if score #cc_near_p overlimit.const matches 1 run return fail
function overlimit:blood_moon/despawn_one
