scoreboard players set #bw_spawn_t overlimit.const 0
execute store result score #bm_diff overlimit.const run difficulty
execute if score #bm_diff overlimit.const matches 0 run return fail

function overlimit:blood_world/cull_far
execute as @a[tag=overlimit.in_bw,gamemode=!spectator] at @s run function overlimit:blood_moon/try_spawn_player
execute as @a[tag=overlimit.in_bw,gamemode=!spectator] at @s run function overlimit:blood_moon/try_spawn_player
