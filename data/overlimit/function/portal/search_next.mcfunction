# この構造物では門を置けなかった。使用済みにして次の未使用を測る。
execute if score #bw_gate overlimit.const matches 1 if entity @s[type=player] run return run function overlimit:portal/to_bw_gate
execute if score #bw_gate overlimit.const matches 1 run return fail
execute if score #bw_warm overlimit.const matches 1 unless entity @a[scores={overlimit.portal_charge=1..}] unless entity @a[tag=overlimit.portal_arrive] if score #bw_warm_cd overlimit.const matches 1.. run return fail
execute if score #bw_reroll_tick overlimit.const matches 1 run return fail
scoreboard players set #bw_reroll_tick overlimit.const 1
scoreboard players add #bw_rand_n overlimit.const 1
execute if score #bw_warm overlimit.const matches 1 unless entity @a[scores={overlimit.portal_charge=1..}] unless entity @a[tag=overlimit.portal_arrive] if score #bw_rand_n overlimit.const matches 8.. run return run function overlimit:portal/warm_give_up
execute if score #bw_rand_n overlimit.const matches 8.. run return run function overlimit:portal/search_give_up
function overlimit:portal/mark_used
execute if data storage overlimit:portal pend.x run function overlimit:portal/unload_pend with storage overlimit:portal pend
kill @e[type=minecraft:marker,tag=overlimit.bw_fl]
execute unless function overlimit:portal/pick_landmark run function overlimit:portal/roll_dest
execute unless data storage overlimit:portal origin.x run return run function overlimit:portal/search_give_up
scoreboard players set #bw_place_wait overlimit.const 0
function overlimit:portal/forceload_dest with storage overlimit:portal origin
execute as @a[tag=overlimit.portal_arrive] if predicate overlimit:in_overworld run function overlimit:portal/forceload_dest with storage overlimit:portal origin
execute if score #bw_warm overlimit.const matches 1 unless entity @a[scores={overlimit.portal_charge=1..}] unless entity @a[tag=overlimit.portal_arrive] run scoreboard players set #bw_warm_cd overlimit.const 20
return 1
