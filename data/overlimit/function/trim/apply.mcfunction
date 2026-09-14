# @s = player. 先に全部外してから、枚数に応じて付け直す。
function overlimit:trim/clear_self
function overlimit:trim/apply_pieces
function overlimit:trim/apply_sets
execute if entity @s[tag=overlimit.trim.set.gold] at @s run function overlimit:trim/gold/equip_calm
execute unless entity @s[tag=overlimit.trim.set.gold] at @s run function overlimit:trim/gold/clear_calm
