execute if entity @a[tag=overlimit.in_bw] run return run function overlimit:portal/session_occupied
execute as @a at @s if dimension overlimit:blood_world run return run function overlimit:portal/session_occupied
execute if entity @a[tag=overlimit.portal_arrive] run return fail
scoreboard players set #bw_reroll_tick overlimit.const 0
scoreboard players add #bw_verify_cd overlimit.const 1
execute if score #bw_verify_cd overlimit.const matches 20.. if score #bw_gate overlimit.const matches 1 run function overlimit:portal/verify_gate
execute if score #bw_warm overlimit.const matches 1 run function overlimit:portal/warm_tick
execute if score #bw_preload overlimit.const matches 1 run return fail
execute if score #bw_warm overlimit.const matches 1 run return fail
function overlimit:portal/session_empty
