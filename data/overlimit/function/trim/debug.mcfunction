# 装飾の数値検証。ゲーム内: /function overlimit:trim/debug
tag @s add overlimit.trim.dbg
function overlimit:trim/scan
execute if entity @s[tag=overlimit.trim.set.emerald] at @s run function overlimit:trim/emerald/tick
tellraw @s {"text":"========== trim debug ==========","color":"gold"}
function overlimit:trim/debug/counts
function overlimit:trim/debug/sets
function overlimit:trim/debug/state
function overlimit:trim/debug/expect
tellraw @s {"text":"— 属性合計 —","color":"yellow"}
function overlimit:trim/debug/attrs
tellraw @s {"text":"— 装飾補正（100倍。未装備は非表示） —","color":"yellow"}
function overlimit:trim/debug/mods
function overlimit:trim/debug/emerald
tellraw @s {"text":"未実装: ネザライト部位の炎ダメ減 / エメラルド部位のイレイジャー被ダメ減","color":"dark_gray"}
function overlimit:trim/debug/menu
tag @s remove overlimit.trim.dbg
