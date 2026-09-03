advancement revoke @s only overlimit:trim/on_land
execute unless entity @s[tag=overlimit.trim.set.amethyst] run return fail
execute if score @s overlimit.trim.amy_cd matches 1.. run return fail
scoreboard players set @s overlimit.trim.amy_cd 20
execute at @s run function overlimit:trim/amethyst/land_at
