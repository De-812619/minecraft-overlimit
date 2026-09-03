particle minecraft:explosion_emitter ~ ~1 ~ 0 0 0 0 1 force
particle minecraft:flash{color:[1.0,0.95,0.55,1.0]} ~ ~1 ~ 0 0 0 0 1 force
particle minecraft:electric_spark ~ ~1 ~ 1.2 0.7 1.2 0.12 80 force
particle minecraft:wax_off ~ ~1 ~ 0.9 0.5 0.9 1.4 28 force
playsound minecraft:item.trident.thunder player @a[distance=..24] ~ ~ ~ 1 1.65
playsound minecraft:entity.lightning_bolt.impact player @a[distance=..24] ~ ~ ~ 1 1.25
execute as @e[type=#overlimit:hostile,tag=!overlimit.summon,distance=..3] run damage @s 5 overlimit:trim_spark by @p[tag=overlimit.trim.hit_src,limit=1]
