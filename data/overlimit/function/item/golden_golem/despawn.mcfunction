# @s = ゴールデンゴーレム（at @s）
tag @s add overlimit.golden_golem_gone
particle minecraft:dust{color:[1.0,0.78,0.18],scale:1.0} ~ ~0.8 ~ 0.3 0.45 0.3 0.02 16
playsound minecraft:entity.iron_golem.death neutral @a ~ ~ ~ 0.6 1.05
data remove entity @s CustomName
tp @s ~ -500 ~
kill @s
