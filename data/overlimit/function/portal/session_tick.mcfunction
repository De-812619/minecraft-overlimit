# 誰かが BW にいるかだけ覚える。門は消さない（対になる門を残す）。
execute if entity @a[tag=overlimit.in_bw] run return run function overlimit:portal/session_occupied
execute as @a at @s if dimension overlimit:blood_world run return run function overlimit:portal/session_occupied
scoreboard players set #bw_occupied overlimit.const 0
