# 実行位置 = 視線の前方。向きはプレイヤーのまま。
scoreboard players add #ul_seq overlimit.const 1
summon minecraft:marker ~ ~ ~ {Tags:["overlimit.ul.slash","overlimit.ul.slash_new"]}
data modify entity @n[type=minecraft:marker,tag=overlimit.ul.slash_new,distance=..2] data.Owner set from entity @s UUID
tp @n[type=minecraft:marker,tag=overlimit.ul.slash_new,distance=..2] ~ ~ ~ ~ ~
scoreboard players set @n[type=minecraft:marker,tag=overlimit.ul.slash_new,distance=..2] overlimit.ul.life 0
scoreboard players operation @n[type=minecraft:marker,tag=overlimit.ul.slash_new,distance=..2] overlimit.ul.sid = #ul_seq overlimit.const
tag @n[type=minecraft:marker,tag=overlimit.ul.slash_new,distance=..2] remove overlimit.ul.slash_new
playsound minecraft:entity.player.attack.sweep player @a[distance=..24] ~ ~ ~ 0.9 1.15
