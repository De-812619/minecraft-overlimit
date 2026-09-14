# 実行位置 = 爆発中心。ブロックは壊さない。半径2、ダメージ10。
playsound minecraft:entity.generic.explode hostile @a[distance=..24] ~ ~ ~ 0.85 1.35
particle minecraft:explosion ~ ~0.45 ~ 0.35 0.25 0.35 0 3 force
execute as @e[distance=..2,type=!minecraft:player] if data entity @s Health run damage @s 10 minecraft:player_explosion by @p[tag=overlimit.ul.atk]
