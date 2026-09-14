advancement revoke @s only overlimit:trim/on_loot
execute unless entity @s[tag=overlimit.trim.set.gold] run return fail
execute at @s if entity @e[type=minecraft:piglin,distance=..16] run scoreboard players set @s overlimit.trim.anger 300
