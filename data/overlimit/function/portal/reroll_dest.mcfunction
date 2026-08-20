# 海など陸地なし。全員を同じ次の抽選へ。同tickの二重抽選はしない。
execute if score #bw_gate overlimit.const matches 1 run return run function overlimit:portal/to_bw_gate
execute if score #bw_reroll_tick overlimit.const matches 1 run return fail
scoreboard players set #bw_reroll_tick overlimit.const 1
scoreboard players add #bw_rand_n overlimit.const 1
execute if score #bw_rand_n overlimit.const matches 12.. run return run function overlimit:portal/last_spread
execute if data storage overlimit:portal pend.x run function overlimit:portal/unload_pend with storage overlimit:portal pend
function overlimit:portal/roll_dest
execute as @a[tag=overlimit.portal_arrive] if predicate overlimit:in_blood_world run function overlimit:portal/tp_search with storage overlimit:portal pend
scoreboard players set @a[tag=overlimit.portal_arrive] overlimit.portal_wait 0
