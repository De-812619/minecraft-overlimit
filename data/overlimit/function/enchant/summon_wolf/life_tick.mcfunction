# Summon lifetime tick（@s = 召喚体）
execute if entity @s[tag=overlimit.summon_wolf] store result score #hp overlimit.const run data get entity @s Health 10
execute if entity @s[tag=overlimit.summon_wolf] if score #hp overlimit.const matches ..15 run data remove entity @s Owner

scoreboard players remove @s overlimit.summon.life 1
execute unless score @s overlimit.summon.life matches ..0 run return fail

particle minecraft:smoke ~ ~0.5 ~ 0.2 0.3 0.2 0.01 8
execute if entity @s[tag=overlimit.summon_wolf] run playsound minecraft:entity.wolf.death neutral @a ~ ~ ~ 0.4 1.2
execute if entity @s[tag=overlimit.necro] run playsound minecraft:entity.zombie.death hostile @a ~ ~ ~ 0.4 0.8

data remove entity @s CustomName
execute if entity @s[tag=overlimit.summon_wolf] run data remove entity @s Owner
tp @s ~ -500 ~
kill @s
