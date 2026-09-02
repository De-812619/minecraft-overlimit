# ディメンション復帰後にロケーターが復活するよう、送信属性を一度動かしてから付け直す
execute in minecraft:overworld unless entity @e[type=minecraft:armor_stand,tag=overlimit.no_waypoint] run function overlimit:nether_overflow/spawn_waypoint with storage overlimit:no gate
execute in minecraft:overworld as @e[type=minecraft:armor_stand,tag=overlimit.no_waypoint] run attribute @s minecraft:waypoint_transmit_range base set 2001
execute in minecraft:overworld as @e[type=minecraft:armor_stand,tag=overlimit.no_waypoint] run attribute @s minecraft:waypoint_transmit_range base set 2000
execute in minecraft:overworld as @e[type=minecraft:armor_stand,tag=overlimit.no_waypoint] run waypoint modify @s color dark_purple
