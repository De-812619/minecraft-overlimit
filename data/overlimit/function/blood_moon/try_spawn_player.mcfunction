# @s = overworld player. 1体。失敗したら別方向を最大8回。
scoreboard players set #bm_spawned overlimit.const 0
execute if predicate overlimit:in_trial_chambers run return fail
execute if biome ~ ~ ~ minecraft:deep_dark run return fail
execute store result score #bm_py overlimit.const run data get entity @s Pos[1]
function overlimit:blood_moon/try_spawn_near
execute if score #bm_spawned overlimit.const matches 0 run function overlimit:blood_moon/try_spawn_near
execute if score #bm_spawned overlimit.const matches 0 run function overlimit:blood_moon/try_spawn_near
execute if score #bm_spawned overlimit.const matches 0 run function overlimit:blood_moon/try_spawn_near
execute if score #bm_spawned overlimit.const matches 0 run function overlimit:blood_moon/try_spawn_near
execute if score #bm_spawned overlimit.const matches 0 run function overlimit:blood_moon/try_spawn_near
execute if score #bm_spawned overlimit.const matches 0 run function overlimit:blood_moon/try_spawn_near
execute if score #bm_spawned overlimit.const matches 0 run function overlimit:blood_moon/try_spawn_near
