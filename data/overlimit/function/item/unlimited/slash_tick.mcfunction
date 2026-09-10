# @s = 斬撃 marker。視線方向へ合計5ブロック進む。
scoreboard players add @s overlimit.ul.life 1
execute unless block ~ ~ ~ #minecraft:replaceable run return run kill @s
particle minecraft:sweep_attack ~ ~ ~ 0.2 0.15 0.2 0 2 force
particle minecraft:crit ~ ~ ~ 0.35 0.2 0.35 0.02 5 force
execute if score @s overlimit.ul.life matches 1..5 run function overlimit:item/unlimited/slash_hurt
execute if score @s overlimit.ul.life matches 6.. run return run kill @s
tp @s ^ ^ ^1.0
