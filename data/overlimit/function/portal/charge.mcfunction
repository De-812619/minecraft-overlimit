# 最低演出のあと、門ができていればすぐ転送。上限は約4秒。
# 吐き気は残り時間が長いほど画面が最大まで歪む。15秒は最大、2秒は見えないので6秒（中くらい）にする。
execute if predicate overlimit:in_overworld if score #bm_active overlimit.const matches 1 run return run function overlimit:portal/charge_denied

scoreboard players add @s overlimit.portal_charge 1
execute if score @s overlimit.portal_charge matches 1 at @s run playsound minecraft:block.portal.trigger player @s ~ ~ ~ 0.7 0.9
execute if score @s overlimit.portal_charge matches 1 run effect give @s minecraft:nausea 6 0 true
execute if score @s overlimit.portal_charge matches 1 run function overlimit:portal/hold_player
execute if score @s overlimit.portal_charge matches 1 if predicate overlimit:in_overworld if score #bw_gate overlimit.const matches 1 run function overlimit:portal/preload_sess
execute if score @s overlimit.portal_charge matches 5.. if predicate overlimit:in_overworld if score #bw_gate overlimit.const matches 0 if score #bw_preload overlimit.const matches 0 run function overlimit:portal/preload_begin
execute if score @s overlimit.portal_charge matches 5.. if predicate overlimit:in_overworld if score #bw_preload overlimit.const matches 1 if score #bw_gate overlimit.const matches 0 run function overlimit:portal/preload_tick
function overlimit:portal/status_bar
execute at @s anchored eyes run particle minecraft:portal ^ ^ ^0.4 0.15 0.15 0.15 0.4 6
execute if score @s overlimit.portal_charge >= #portal_charge_min overlimit.const if score #bw_gate overlimit.const matches 1 run function overlimit:portal/try_warp
execute if score @s overlimit.portal_charge >= #portal_charge_need overlimit.const run function overlimit:portal/try_warp
