# Residual smoke at half rate (every 2 ticks). @s = player on impact CD.
scoreboard players operation #impact_fx overlimit.const = @s overlimit.cd.impact
scoreboard players operation #impact_fx overlimit.const %= #2 overlimit.const
execute unless score #impact_fx overlimit.const matches 0 run return fail
particle minecraft:smoke ~ ~0.25 ~ 0.1 0.04 0.1 0.008 1 normal @s
execute anchored eyes positioned ^-0.35 ^-0.3 ^0.5 run particle minecraft:smoke ~ ~ ~ 0.03 0.03 0.03 0.004 1 normal @s
