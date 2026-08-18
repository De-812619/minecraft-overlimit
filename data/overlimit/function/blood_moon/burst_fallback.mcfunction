# 高さマップが外れた地点だけ、もう一度地表へ合わせて試す。足元Yへは出さない。
execute if score #bm_wave overlimit.const >= #bm_spawn_burst overlimit.const run return fail
scoreboard players set #bm_spawned overlimit.const 0
execute positioned over motion_blocking_no_leaves run function overlimit:blood_moon/burst_surface
execute if score #bm_spawned overlimit.const matches 1 run return 1
execute positioned over world_surface run function overlimit:blood_moon/burst_surface
