# @s = スポーン直後のミニゴーレム（at @s）
tag @s add overlimit.mini_golem_ready
attribute @s minecraft:scale base set 0.7
attribute @s minecraft:max_health base set 250
data modify entity @s Health set value 250.0f
data modify entity @s PlayerCreated set value 1b
data modify entity @s PersistenceRequired set value 1b
data modify entity @s CustomName set value {"text":"ミニゴーレム"}
data modify entity @s CustomNameVisible set value 0b
data modify entity @s DeathLootTable set value "minecraft:empty"
playsound minecraft:entity.iron_golem.repair neutral @a ~ ~ ~ 1 1.2
particle minecraft:cloud ~ ~1 ~ 0.3 0.4 0.3 0.02 12
