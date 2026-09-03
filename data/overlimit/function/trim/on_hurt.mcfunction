advancement revoke @s only overlimit:trim/on_hurt
execute unless entity @s[tag=overlimit.trim.set.resin] run return fail
execute at @s on attacker if entity @s[type=#overlimit:hostile,tag=!overlimit.summon] run effect give @s minecraft:slowness 1 1 false
