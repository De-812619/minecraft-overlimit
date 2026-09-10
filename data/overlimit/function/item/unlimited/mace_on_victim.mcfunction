# @s = post_attack の被害者。約4ブロック相当の初速。
execute on attacker unless entity @s[type=minecraft:player] run return fail
execute on attacker unless items entity @s weapon.mainhand *[custom_data~{overlimit:{unlimited_mace:true}}] run return fail
execute unless entity @s[type=#overlimit:can_be_danger] run return fail
data modify entity @s OnGround set value 0b
data modify entity @s Motion[1] set value 0.8d
execute at @s run playsound minecraft:entity.wind_charge.wind_burst player @a[distance=..24] ~ ~ ~ 0.95 0.75
execute at @s run playsound minecraft:item.mace.smash_air player @a[distance=..24] ~ ~ ~ 1 0.85
execute at @s run particle minecraft:gust_emitter_small ~ ~1 ~ 0 0 0 0 1 force
execute at @s run particle minecraft:gust ~ ~0.7 ~ 0.55 0.25 0.55 0 8 force
execute at @s run particle minecraft:cloud ~ ~1 ~ 0.4 0.35 0.4 0.18 16 force
execute at @s run particle minecraft:wax_on ~ ~1.1 ~ 0.25 0.45 0.25 0.7 10 force
