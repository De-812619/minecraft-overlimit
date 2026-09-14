# @s = プレイヤー。+3 HP（ハート1.5）。プレイヤー NBT の Health は書けないので、
# 一時的に max_health を目標値まで下げて Instant Health で満タンにし、修飾子を外す。
execute store result score #ul_hp overlimit.const run data get entity @s Health 100
execute store result score #ul_max overlimit.const run attribute @s minecraft:max_health get 100
execute if score #ul_hp overlimit.const >= #ul_max overlimit.const run return fail
scoreboard players add #ul_hp overlimit.const 300
execute if score #ul_hp overlimit.const > #ul_max overlimit.const run scoreboard players operation #ul_hp overlimit.const = #ul_max overlimit.const
scoreboard players operation #ul_delta overlimit.const = #ul_hp overlimit.const
scoreboard players operation #ul_delta overlimit.const -= #ul_max overlimit.const
attribute @s minecraft:max_health modifier remove overlimit:ul.heal_cap
execute if score #ul_delta overlimit.const matches ..-1 run function overlimit:item/unlimited/armor_heal_cap_prep
effect give @s minecraft:instant_health 1 4 true
attribute @s minecraft:max_health modifier remove overlimit:ul.heal_cap
particle minecraft:heart ~ ~1.2 ~ 0.28 0.35 0.28 0 3
playsound minecraft:entity.player.levelup player @s ~ ~ ~ 0.35 1.8
