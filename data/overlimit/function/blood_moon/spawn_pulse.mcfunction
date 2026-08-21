# 4秒ごと。遠い個体を消してから補充。プレイヤー1人あたり最大2体。
scoreboard players set #bm_spawn_t overlimit.const 0
execute store result score #bm_diff overlimit.const run difficulty
execute if score #bm_diff overlimit.const matches 0 run return fail

function overlimit:blood_moon/cull_far
execute as @a[predicate=overlimit:in_overworld,gamemode=!spectator] at @s run function overlimit:blood_moon/try_spawn_player
execute as @a[predicate=overlimit:in_overworld,gamemode=!spectator] at @s run function overlimit:blood_moon/try_spawn_player
