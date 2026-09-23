# @s = ミニゴーレム（at @s）
tag @s add overlimit.mini_golem_gone
particle minecraft:smoke ~ ~0.8 ~ 0.25 0.4 0.25 0.02 12
playsound minecraft:entity.iron_golem.death neutral @a ~ ~ ~ 0.6 1.2
data remove entity @s CustomName
tp @s ~ -500 ~
kill @s
