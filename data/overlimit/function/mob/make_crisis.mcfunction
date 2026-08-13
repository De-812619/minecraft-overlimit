tag @s add overlimit.elite
tag @s add overlimit.crisis
data modify entity @s CustomName set value {"text":"CRISIS","color":"dark_purple","bold":true}
data modify entity @s CustomNameVisible set value 1b

attribute @s minecraft:max_health modifier add overlimit:crisis_hp 5.0 add_multiplied_base
attribute @s minecraft:attack_damage modifier add overlimit:crisis_atk 2.0 add_multiplied_base
attribute @s minecraft:armor modifier add overlimit:crisis_def 2.0 add_multiplied_base
attribute @s minecraft:scale modifier add overlimit:crisis_scale 0.5 add_multiplied_base
execute store result entity @s Health float 1 run attribute @s minecraft:max_health get

item replace entity @s armor.head with minecraft:netherite_helmet
data merge entity @s {drop_chances:{head:0.0f}}

execute at @s run summon minecraft:marker ~ ~ ~ {Tags:["overlimit.elite_xp","overlimit.elite_xp.setup","overlimit.xp_crisis"]}
function overlimit:mob/mount_xp_marker
