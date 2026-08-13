# Single-target hate so summons can duel nearby hostiles (not AoE).
# Every 10 ticks: 1 damage to nearest enemy in 5 blocks + approach.
scoreboard players operation #mod overlimit.const = @s overlimit.summon.life
scoreboard players operation #mod overlimit.const %= #10 overlimit.const
execute if score #mod overlimit.const matches 0 as @n[type=#overlimit:hostile,tag=!overlimit.summon,tag=!overlimit.necro,distance=..5] run damage @s 1 minecraft:mob_attack by @n[tag=overlimit.necro]
execute facing entity @n[type=#overlimit:hostile,tag=!overlimit.summon,tag=!overlimit.necro,distance=..5] feet positioned ^ ^ ^0.25 if block ~ ~ ~ #minecraft:replaceable if block ~ ~1 ~ #minecraft:replaceable run tp @s ~ ~ ~
