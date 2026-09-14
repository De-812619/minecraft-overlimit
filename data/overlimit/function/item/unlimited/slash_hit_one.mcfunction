# @s = 当たったエンティティ。同じ斬撃では一度だけ。
execute if entity @s[tag=overlimit.ul.attacker] run return fail
execute if score @s overlimit.ul.sid = #ul_sid overlimit.const run return fail
scoreboard players operation @s overlimit.ul.sid = #ul_sid overlimit.const
damage @s 3 minecraft:player_attack by @p[tag=overlimit.ul.attacker]
