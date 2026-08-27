tag @s add overlimit.xp_boosted
execute store result score #xp overlimit.const run data get entity @s Value
scoreboard players operation #xp overlimit.const *= #xp_scale overlimit.const
scoreboard players operation #xp overlimit.const /= #100 overlimit.const
execute store result entity @s Value int 1 run scoreboard players get #xp overlimit.const
