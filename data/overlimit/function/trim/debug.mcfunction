# 装飾の数値検証。ゲーム内: /function overlimit:trim/debug
tag @s add overlimit.trim.dbg
function overlimit:trim/scan
execute if entity @s[tag=overlimit.trim.set.emerald] at @s run function overlimit:trim/emerald/tick
tellraw @s {"text":"========== trim debug ==========","color":"gold"}
function overlimit:trim/debug/counts
function overlimit:trim/debug/sets
function overlimit:trim/debug/state
function overlimit:trim/debug/expect
tellraw @s {"translate": "overlimit.trim.dbg.attrs","color":"yellow"}
function overlimit:trim/debug/attrs
tellraw @s {"translate": "overlimit.trim.dbg.mods","color":"yellow"}
function overlimit:trim/debug/mods
function overlimit:trim/debug/emerald
tellraw @s {"translate": "overlimit.trim.dbg.todo","color":"dark_gray"}
function overlimit:trim/debug/menu
tag @s remove overlimit.trim.dbg
