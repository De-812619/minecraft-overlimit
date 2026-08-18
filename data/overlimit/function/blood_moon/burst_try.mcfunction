# @s = player. 実行位置 = XZ オフセット（Yは無視して高さマップへ）。
scoreboard players set #bm_spawned overlimit.const 0
execute positioned over motion_blocking_no_leaves run function overlimit:blood_moon/burst_surface
execute if score #bm_spawned overlimit.const matches 1 run return 1
execute positioned over world_surface run function overlimit:blood_moon/burst_surface


