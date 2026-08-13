# @s = player who hit a block with Impact. CD 5s.
execute if score @s overlimit.cd.impact matches 1.. run return fail
scoreboard players set @s overlimit.cd.impact 100

# Locate the struck block, then blast horizontally from it (ignore look pitch).
scoreboard players set #impact_ray overlimit.const 0
execute anchored eyes positioned ^ ^ ^0.5 run function overlimit:enchant/impact/find_hit
