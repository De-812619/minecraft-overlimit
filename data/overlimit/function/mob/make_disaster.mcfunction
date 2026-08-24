tag @s add overlimit.elite
tag @s add overlimit.disaster
data modify entity @s CustomName set value {"text":"DISASTER","color":"blue","bold":true}
data modify entity @s CustomNameVisible set value 1b

attribute @s minecraft:max_health modifier add overlimit:disaster_hp 9.0 add_multiplied_base
attribute @s minecraft:attack_damage modifier add overlimit:disaster_atk 4.0 add_multiplied_base
attribute @s minecraft:armor modifier add overlimit:disaster_def 4.0 add_multiplied_base
execute at @s if block ~ ~2 ~ #minecraft:replaceable if block ~ ~3 ~ #minecraft:replaceable run attribute @s minecraft:scale modifier add overlimit:disaster_scale 0.8 add_multiplied_base
execute store result entity @s Health float 1 run attribute @s minecraft:max_health get

item replace entity @s armor.head with minecraft:netherite_helmet
data merge entity @s {drop_chances:{head:0.0f}}

execute at @s run summon minecraft:marker ~ ~ ~ {Tags:["overlimit.elite_xp","overlimit.elite_xp.setup","overlimit.xp_disaster"]}
function overlimit:mob/mount_xp_marker
