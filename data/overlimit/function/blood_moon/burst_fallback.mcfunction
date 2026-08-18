# 高さマップが全部外れたときの最終手段。暗い場所にだけ足元近くへ出す。
execute if score #bm_wave overlimit.const >= #bm_spawn_burst overlimit.const run return fail
execute unless predicate overlimit:blood_moon_dark_spawn run return fail
scoreboard players set #bm_spawned overlimit.const 0
function overlimit:blood_moon/summon_one
execute if score #bm_spawned overlimit.const matches 1 run scoreboard players add #bm_wave overlimit.const 1
