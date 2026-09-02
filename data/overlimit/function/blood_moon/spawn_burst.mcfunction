# 開始時。まず出してから自然スポーンを止める。
execute store result score #bm_diff overlimit.const run difficulty
execute if score #bm_diff overlimit.const matches 0 run return fail
function overlimit:blood_moon/cull_far
execute as @a[gamemode=!spectator] at @s if dimension minecraft:overworld run function overlimit:blood_moon/try_spawn_burst
