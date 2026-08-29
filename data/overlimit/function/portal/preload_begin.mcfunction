# チャージ開始で測量・チャンク読み・門の設置を始める。
execute if score #bw_gate overlimit.const matches 1 run return run function overlimit:portal/preload_sess
execute if score #bw_pending overlimit.const matches 1 run return fail
execute if score #bw_preload overlimit.const matches 1 run return fail
scoreboard players set #bw_preload overlimit.const 1
scoreboard players set #bw_warm_cd overlimit.const 0
scoreboard players set #bw_place_wait overlimit.const 0
scoreboard players set #bw_rand_n overlimit.const 0
scoreboard players set #bw_warm_fail overlimit.const 0
execute unless function overlimit:portal/pick_landmark run scoreboard players set #bw_preload overlimit.const 0
execute unless score #bw_found overlimit.const matches 1 run return fail
function overlimit:portal/forceload_dest with storage overlimit:portal origin
return 1
