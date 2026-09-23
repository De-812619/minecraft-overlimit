# Glow hostiles within 32 while sneaking. 効果は 2 秒なので 2tick に 1 回で足りる。
execute store result score #cv overlimit.const run time query gametime
scoreboard players operation #cv overlimit.const %= #2 overlimit.const
execute unless score #cv overlimit.const matches 0 run return fail
effect give @e[type=#overlimit:hostile,distance=..32] minecraft:glowing 2 0 true
