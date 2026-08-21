# 約5秒（100 tick）溜めてから転送。歪みは吐き気（ポータル実ブロックは使わない）。
execute if predicate overlimit:in_overworld if score #bm_active overlimit.const matches 1 run return run function overlimit:portal/charge_denied

scoreboard players add @s overlimit.portal_charge 1
execute if score @s overlimit.portal_charge matches 1 at @s run playsound minecraft:block.portal.trigger player @s ~ ~ ~ 0.7 0.9
execute if score @s overlimit.portal_charge matches 1 run effect give @s minecraft:nausea 6 0 true
execute at @s anchored eyes run particle minecraft:portal ^ ^ ^0.4 0.15 0.15 0.15 0.4 6
execute if score @s overlimit.portal_charge >= #portal_charge_need overlimit.const run function overlimit:portal/try_warp
