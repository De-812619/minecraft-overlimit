# @s = 斬撃 marker
data modify storage overlimit:ul owner set from entity @s data.Owner
scoreboard players operation #ul_sid overlimit.const = @s overlimit.ul.sid
tag @a remove overlimit.ul.attacker
execute as @a run function overlimit:item/unlimited/match_owner
execute as @e[distance=..1.4] unless entity @s[type=#overlimit:impact_blast_exclude] if data entity @s Health run function overlimit:item/unlimited/slash_hit_one
tag @a remove overlimit.ul.attacker
