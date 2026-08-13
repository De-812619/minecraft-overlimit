# @s = new wolf
tag @s remove overlimit.summon_new
scoreboard players set @s overlimit.summon.life 200
team join overlimit @s
data modify entity @s Owner set from entity @p[tag=overlimit.summoning] UUID
data modify entity @s CustomName set value {"text":"フェンリル","color":"green"}
data modify entity @s CustomNameVisible set value 0b
