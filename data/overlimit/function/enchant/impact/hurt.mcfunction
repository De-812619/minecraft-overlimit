# @s = living non-player. Execution position = blast center.
# Damage ≈ creeper power 3 at Normal, exposure 1 (distance falloff).
execute if entity @s[distance=..1] run damage @s 22 minecraft:player_explosion by @p[tag=overlimit.impact_attacker]
execute unless entity @s[distance=..1] if entity @s[distance=..2] run damage @s 17 minecraft:player_explosion by @p[tag=overlimit.impact_attacker]
execute unless entity @s[distance=..2] if entity @s[distance=..3] run damage @s 13 minecraft:player_explosion by @p[tag=overlimit.impact_attacker]
execute unless entity @s[distance=..3] if entity @s[distance=..4] run damage @s 9 minecraft:player_explosion by @p[tag=overlimit.impact_attacker]
execute unless entity @s[distance=..4] if entity @s[distance=..5] run damage @s 6 minecraft:player_explosion by @p[tag=overlimit.impact_attacker]
execute unless entity @s[distance=..5] if entity @s[distance=..6] run damage @s 3 minecraft:player_explosion by @p[tag=overlimit.impact_attacker]

execute if entity @s at @s run function overlimit:enchant/impact/knock
