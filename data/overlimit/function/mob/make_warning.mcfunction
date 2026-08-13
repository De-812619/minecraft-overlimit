tag @s add overlimit.elite
tag @s add overlimit.warning
data modify entity @s CustomName set value {"text":"WARNING","color":"gold","bold":true}
data modify entity @s CustomNameVisible set value 1b

attribute @s minecraft:max_health modifier add overlimit:warning_hp 1.0 add_multiplied_base
execute store result entity @s Health float 1 run attribute @s minecraft:max_health get

item replace entity @s armor.head with minecraft:iron_helmet
data merge entity @s {drop_chances:{head:0.0f}}

execute at @s run summon minecraft:marker ~ ~ ~ {Tags:["overlimit.elite_xp","overlimit.elite_xp.setup","overlimit.xp_warning"]}
function overlimit:mob/mount_xp_marker
