# @s = 感電させる相手（できれば命中したMob）。位置は命中点。
playsound minecraft:entity.lightning_bolt.impact weather @a[distance=..24] ~ ~ ~ 0.85 1.35
particle minecraft:flash{color:[0.85,0.92,1.0,1.0]} ~ ~1.2 ~ 0 0 0 0 1 force
particle minecraft:electric_spark ~ ~9 ~ 0.05 4.5 0.05 0.02 50 force
particle minecraft:electric_spark ~ ~4 ~ 0.08 2.0 0.08 0.04 28 force
particle minecraft:electric_spark ~ ~1.2 ~ 0.25 0.6 0.25 0.12 20 force
execute if entity @s[type=#overlimit:can_be_danger] run return run function overlimit:item/unlimited/spear_shock
execute as @e[distance=..8,type=#overlimit:can_be_danger,limit=1,sort=nearest] run function overlimit:item/unlimited/spear_shock
