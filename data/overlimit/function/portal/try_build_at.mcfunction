# チャージ中に門だけ置く。成功してもプレイヤーは OW に残す。
scoreboard players set #bw_no_tp overlimit.const 1
$execute in overlimit:blood_world positioned $(x) 64 $(z) unless loaded ~ ~ ~ run forceload add ~-32 ~-32 ~32 ~32
$execute in overlimit:blood_world positioned $(x) 64 $(z) unless loaded ~ ~ ~ run scoreboard players set #bw_no_tp overlimit.const 0
$execute in overlimit:blood_world positioned $(x) 64 $(z) unless loaded ~ ~ ~ run return fail
$execute in overlimit:blood_world positioned $(x) 64 $(z) if function overlimit:portal/ensure_remote run function overlimit:portal/mark_session_here
execute if score #bw_gate overlimit.const matches 1 run function overlimit:portal/mark_used
execute if score #bw_gate overlimit.const matches 1 run scoreboard players set #bw_no_tp overlimit.const 0
execute if score #bw_gate overlimit.const matches 1 run return 1
$execute in overlimit:blood_world positioned $(x) 64 $(z) if function overlimit:portal/is_ungenerated run scoreboard players set #bw_no_tp overlimit.const 0
$execute in overlimit:blood_world positioned $(x) 64 $(z) if function overlimit:portal/is_ungenerated run return fail
$execute in overlimit:blood_world positioned $(x) 64 $(z) if function overlimit:portal/find_land run function overlimit:portal/mark_session_here
execute if score #bw_gate overlimit.const matches 1 run function overlimit:portal/mark_used
scoreboard players set #bw_no_tp overlimit.const 0
execute if score #bw_gate overlimit.const matches 1 run return 1
return fail
