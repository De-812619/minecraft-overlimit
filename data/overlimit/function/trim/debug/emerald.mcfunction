execute unless entity @s[tag=overlimit.trim.set.emerald] run return fail
execute at @s unless entity @e[type=#overlimit:trim_illager,distance=..8] run tellraw @s {"translate": "overlimit.trim.dbg.no_illager","color":"dark_gray"}
execute at @s as @e[type=#overlimit:trim_illager,distance=..8,limit=5] run function overlimit:trim/debug/emerald_one
