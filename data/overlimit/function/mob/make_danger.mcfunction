tag @s add overlimit.elite
tag @s add overlimit.danger
data modify entity @s CustomName set value {"text":"DANGER","color":"red","bold":true}
data modify entity @s CustomNameVisible set value 1b

attribute @s minecraft:max_health modifier add overlimit:danger_hp 3.0 add_multiplied_base
attribute @s minecraft:attack_damage modifier add overlimit:danger_atk 1.0 add_multiplied_base
attribute @s minecraft:armor modifier add overlimit:danger_def 1.0 add_multiplied_base
execute store result entity @s Health float 1 run attribute @s minecraft:max_health get

item replace entity @s armor.head with minecraft:diamond_helmet
data merge entity @s {drop_chances:{head:0.0f}}

execute at @s run summon minecraft:marker ~ ~ ~ {Tags:["overlimit.elite_xp","overlimit.elite_xp.setup","overlimit.xp_danger","overlimit.danger_xp"]}
function overlimit:mob/mount_xp_marker
