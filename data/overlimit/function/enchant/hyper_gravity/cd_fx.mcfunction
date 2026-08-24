# Residual portal at half rate (every 2 ticks). @s = player on hyper gravity CD.
scoreboard players operation #hg_fx overlimit.const = @s overlimit.cd.hyper
scoreboard players operation #hg_fx overlimit.const %= #2 overlimit.const
execute unless score #hg_fx overlimit.const matches 0 run return fail
particle minecraft:portal ~ ~0.25 ~ 0.1 0.04 0.1 0.2 1 normal @s
execute anchored eyes positioned ^-0.35 ^-0.3 ^0.5 run particle minecraft:portal ~ ~ ~ 0.03 0.03 0.03 0.15 1 normal @s
