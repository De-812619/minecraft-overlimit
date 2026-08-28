# 戦場24以内なら残す。さもなくば最寄プレイヤー水平32以内なら残す。
execute if entity @e[type=minecraft:marker,tag=overlimit.nr_target,distance=..24] run return fail
scoreboard players set #nr_near_lim overlimit.const 32
scoreboard players set #nr_near_p overlimit.const 0
execute store result score #nr_cx overlimit.const run data get entity @s Pos[0]
execute store result score #nr_cz overlimit.const run data get entity @s Pos[2]
execute as @a[predicate=overlimit:in_nether,gamemode=!spectator,gamemode=!creative,distance=..48] run function overlimit:nether_raise/near_one
execute if score #nr_near_p overlimit.const matches 1 run return fail
function overlimit:blood_moon/despawn_one
