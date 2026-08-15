# @s = attacker. Position is still the victim (execute on does not change pos).
execute unless entity @s[type=minecraft:player] run return fail
execute if score @s overlimit.cd.impact matches 1.. run return fail
scoreboard players set @s overlimit.cd.impact 200
tag @s add overlimit.impact_attacker
function overlimit:enchant/impact/blast
tag @s remove overlimit.impact_attacker
