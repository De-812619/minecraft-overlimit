# ディメンション復帰後にロケーターが復活するよう、送信属性を一度動かしてから付け直す
execute in minecraft:the_nether unless entity @e[type=minecraft:armor_stand,tag=overlimit.nr_waypoint] run function overlimit:nether_raise/spawn_waypoint with storage overlimit:nr target
execute in minecraft:the_nether as @e[type=minecraft:armor_stand,tag=overlimit.nr_waypoint] run attribute @s minecraft:waypoint_transmit_range base set 2001
execute in minecraft:the_nether as @e[type=minecraft:armor_stand,tag=overlimit.nr_waypoint] run attribute @s minecraft:waypoint_transmit_range base set 2000
execute in minecraft:the_nether as @e[type=minecraft:armor_stand,tag=overlimit.nr_waypoint] run waypoint modify @s color gold
