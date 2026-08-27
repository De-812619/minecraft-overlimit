execute in minecraft:the_end unless entity @e[type=minecraft:armor_stand,tag=overlimit.cc_waypoint] run function overlimit:city_clamp/spawn_waypoint with storage overlimit:cc target
execute in minecraft:the_end as @e[type=minecraft:armor_stand,tag=overlimit.cc_waypoint] run attribute @s minecraft:waypoint_transmit_range base set 2001
execute in minecraft:the_end as @e[type=minecraft:armor_stand,tag=overlimit.cc_waypoint] run attribute @s minecraft:waypoint_transmit_range base set 2000
execute in minecraft:the_end as @e[type=minecraft:armor_stand,tag=overlimit.cc_waypoint] run waypoint modify @s color blue
