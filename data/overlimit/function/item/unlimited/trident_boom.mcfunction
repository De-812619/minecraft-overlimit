# 実行位置 = トライデント着弾点。地形は壊さない。インパクトの爆煙は使わない。
tag @s add overlimit.ul.tri_boom
execute on origin run tag @s add overlimit.ul.atk
playsound minecraft:entity.firework_rocket.blast player @a[distance=..32] ~ ~ ~ 1.15 0.95
playsound minecraft:entity.firework_rocket.twinkle player @a[distance=..24] ~ ~ ~ 0.9 1.15
particle minecraft:flash{color:[1.0,0.82,0.22,1.0]} ~ ~0.35 ~ 0 0 0 0 1 force
particle minecraft:wax_on ~ ~0.4 ~ 0.45 0.5 0.45 1.2 28 force
particle minecraft:firework ~ ~0.4 ~ 0.35 0.45 0.35 0.12 28 force
particle minecraft:dust{color:[1.0,0.78,0.18],scale:1.2} ~ ~0.35 ~ 0.35 0.4 0.35 0.02 18 force
execute as @e[type=#overlimit:can_be_danger,distance=..3] run damage @s 20 minecraft:player_explosion by @p[tag=overlimit.ul.atk]
execute on origin run tag @s remove overlimit.ul.atk
