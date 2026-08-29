# locate は最寄り1件だけ返す。タグ一括だと4点測量が村とバストリオンを混ぜて海座標になる。
scoreboard players set #bw_found overlimit.const 0
scoreboard players set #bw_bestd overlimit.const 999999
data modify storage overlimit:portal scan_kind set value "#minecraft:village"
scoreboard players set #bw_oi overlimit.const 0
function overlimit:portal/scan_pick_idx
data modify storage overlimit:portal scan_kind set value "minecraft:pillager_outpost"
scoreboard players set #bw_oi overlimit.const 0
function overlimit:portal/scan_pick_idx
data modify storage overlimit:portal scan_kind set value "overlimit:bastion_remnant"
scoreboard players set #bw_oi overlimit.const 0
function overlimit:portal/scan_pick_idx
execute if score #bw_found overlimit.const matches 0 run function overlimit:portal/scan_ring_all
execute if score #bw_found overlimit.const matches 0 run return fail
execute store result storage overlimit:portal origin.x int 1 run scoreboard players get #bw_wx overlimit.const
execute store result storage overlimit:portal origin.z int 1 run scoreboard players get #bw_wz overlimit.const
execute store result storage overlimit:portal landmark.x int 1 run scoreboard players get #bw_wx overlimit.const
execute store result storage overlimit:portal landmark.z int 1 run scoreboard players get #bw_wz overlimit.const
execute store result storage overlimit:portal pend.x int 1 run scoreboard players get #bw_wx overlimit.const
execute store result storage overlimit:portal pend.z int 1 run scoreboard players get #bw_wz overlimit.const
data modify storage overlimit:portal pend.y set value 220
data modify storage overlimit:portal pend.dim set value "overlimit:blood_world"
scoreboard players set #bw_survey_ok overlimit.const 1
return 1
