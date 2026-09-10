# 斧の攻撃クールダウンと同じ長さ（20 / attack_speed tick）。
execute store result score #ul_aps overlimit.const run attribute @s minecraft:attack_speed get 100
execute unless score #ul_aps overlimit.const matches 1.. run scoreboard players set #ul_aps overlimit.const 125
scoreboard players set @s overlimit.ul.ax_cd 2000
scoreboard players operation @s overlimit.ul.ax_cd /= #ul_aps overlimit.const
