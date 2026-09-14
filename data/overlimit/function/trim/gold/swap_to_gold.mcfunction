data modify storage overlimit:trim gold_orig set from entity @s equipment.head.id
kill @e[type=minecraft:armor_stand,tag=overlimit.trim.gold_tmp,distance=..8]
summon minecraft:armor_stand ~ ~1 ~ {Tags:["overlimit.trim.gold_tmp"],Marker:1b,Invisible:1b,NoGravity:1b,Invulnerable:1b,Silent:1b}
item replace entity @n[type=minecraft:armor_stand,tag=overlimit.trim.gold_tmp,distance=..4] armor.head from entity @s armor.head
execute as @n[type=minecraft:armor_stand,tag=overlimit.trim.gold_tmp,distance=..4] run function overlimit:trim/gold/mutate_head
item replace entity @s armor.head from entity @n[type=minecraft:armor_stand,tag=overlimit.trim.gold_tmp,distance=..4] armor.head
kill @e[type=minecraft:armor_stand,tag=overlimit.trim.gold_tmp,distance=..4]
