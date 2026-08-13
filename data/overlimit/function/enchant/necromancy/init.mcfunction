# @s = new necro summon
tag @s remove overlimit.necro_new
scoreboard players set @s overlimit.summon.life 200
scoreboard players operation @s overlimit.necro_owner = @a[tag=overlimit.necro_owner,limit=1] overlimit.necro_owner
team join overlimit @s
data modify entity @s CustomName set value {"text":"魂","color":"green"}
data modify entity @s CustomNameVisible set value 0b
data modify entity @s CanPickUpLoot set value 0b
attribute @s minecraft:scale base set 0.5
