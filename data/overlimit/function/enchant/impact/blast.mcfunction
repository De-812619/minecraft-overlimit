# Position = hit mob. Creeper-like blast: no block damage, no player damage/knock.
# Entity radius = power 3 × 2 = 6.
playsound minecraft:entity.generic.explode hostile @a[distance=..64] ~ ~ ~ 4 0.8
particle minecraft:explosion_emitter ~ ~ ~ 0 0 0 0 1 force
particle minecraft:explosion ~ ~ ~ 0.6 0.6 0.6 0.1 8 force

summon minecraft:marker ~ ~ ~ {Tags:["overlimit.kb_center","overlimit.impact_blast"]}
execute as @e[distance=..6,type=!#overlimit:impact_blast_exclude] if data entity @s Health run function overlimit:enchant/impact/hurt
kill @e[type=minecraft:marker,tag=overlimit.impact_blast,distance=..2]
