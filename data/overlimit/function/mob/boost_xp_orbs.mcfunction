scoreboard players set #xp_scale overlimit.const 35
execute if entity @s[tag=overlimit.xp_warning] run scoreboard players set #xp_scale overlimit.const 50
execute if entity @s[tag=overlimit.xp_crisis] run scoreboard players set #xp_scale overlimit.const 25
execute if entity @s[tag=overlimit.xp_disaster] run scoreboard players set #xp_scale overlimit.const 20
execute as @e[type=minecraft:experience_orb,distance=..8,tag=!overlimit.xp_boosted] run function overlimit:mob/scale_xp_orb
