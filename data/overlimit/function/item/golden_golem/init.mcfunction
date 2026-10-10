# @s = スポーン直後のゴールデンゴーレム（at @s）
tag @s add overlimit.golden_golem_ready
team join overlimit @s
attribute @s minecraft:scale base set 0.7
attribute @s minecraft:max_health base set 300
execute store success score #golden_atk overlimit.const run attribute @s minecraft:attack_damage modifier value get overlimit:golden_golem_atk
execute if score #golden_atk overlimit.const matches 0 run attribute @s minecraft:attack_damage modifier add overlimit:golden_golem_atk 0.3 add_multiplied_base
data modify entity @s Health set value 300.0f
execute store result score @s overlimit.golem_hp run data get entity @s Health 10
data modify entity @s PlayerCreated set value 1b
data modify entity @s PersistenceRequired set value 1b
data modify entity @s CustomName set value {"translate":"overlimit.item.golden_golem","color":"gold"}
data modify entity @s CustomNameVisible set value 0b
data modify entity @s DeathLootTable set value "minecraft:empty"
scoreboard players set @s overlimit.golem_idle 0
playsound minecraft:entity.iron_golem.repair neutral @a ~ ~ ~ 1 1.05
particle minecraft:dust{color:[1.0,0.78,0.18],scale:1.1} ~ ~1 ~ 0.35 0.5 0.35 0.02 18
