# 最後の一人が出たあと、次の門を裏で用意する。
execute if score #bw_warm overlimit.const matches 1 run return fail
execute if score #bw_gate overlimit.const matches 1 run return fail
execute if entity @a[tag=overlimit.in_bw] run return fail
execute if entity @a[tag=overlimit.portal_arrive] run return fail
scoreboard players set #bw_warm overlimit.const 1
scoreboard players set #bw_warm_fail overlimit.const 0
scoreboard players set #bw_warm_cd overlimit.const 0
scoreboard players set #bw_place_wait overlimit.const 0
scoreboard players set #bw_rand_n overlimit.const 0
scoreboard players set #bw_preload overlimit.const 0
execute unless function overlimit:portal/pick_landmark run return run function overlimit:portal/warm_give_up
function overlimit:portal/forceload_dest with storage overlimit:portal origin
return 1
