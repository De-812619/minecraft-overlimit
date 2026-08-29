# 誰もチャージしていなければ、次門の設置を少しずつ進める。
execute unless score #bw_warm overlimit.const matches 1 run return fail
execute if score #bw_warm_fail overlimit.const matches 1 run return fail
execute if entity @a[scores={overlimit.portal_charge=1..}] run return fail
execute if entity @a[tag=overlimit.portal_arrive] run return fail
execute if score #bw_warm_cd overlimit.const matches 1.. run scoreboard players remove #bw_warm_cd overlimit.const 1
execute if score #bw_gate overlimit.const matches 1 run return fail
function overlimit:portal/preload_tick
