# 未使用の陸地構造物でも門を置けなかった。帰り門へ戻す。
execute if score #bw_warm overlimit.const matches 1 unless entity @a[tag=overlimit.portal_arrive] unless entity @a[scores={overlimit.portal_charge=1..}] run return run function overlimit:portal/warm_give_up
execute if score #bw_preload overlimit.const matches 1 unless entity @a[tag=overlimit.portal_arrive] run return run function overlimit:portal/preload_restart
execute if data storage overlimit:portal pend.x run function overlimit:portal/unload_pend with storage overlimit:portal pend
execute as @a[tag=overlimit.portal_arrive] run function overlimit:portal/search_stuck
scoreboard players set #bw_pending overlimit.const 0
scoreboard players set #bw_spread overlimit.const 0
