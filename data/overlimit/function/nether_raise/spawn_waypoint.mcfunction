# 重複を一掃してから1体だけ置く。属性は base set（modifier だと付かないことがある）
execute in minecraft:the_nether run kill @e[type=minecraft:armor_stand,tag=overlimit.nr_waypoint]
$execute in minecraft:the_nether positioned $(x) $(y) $(z) run summon minecraft:armor_stand ~ ~1 ~ {Invisible:1b,NoGravity:1b,Marker:0b,Small:1b,Silent:1b,Invulnerable:1b,PersistenceRequired:1b,Tags:["overlimit.nr_waypoint"]}
$execute in minecraft:the_nether positioned $(x) $(y) $(z) as @e[type=minecraft:armor_stand,tag=overlimit.nr_waypoint,distance=..4,limit=1,sort=nearest] run attribute @s minecraft:waypoint_transmit_range base set 2000
$execute in minecraft:the_nether positioned $(x) $(y) $(z) as @e[type=minecraft:armor_stand,tag=overlimit.nr_waypoint,distance=..4,limit=1,sort=nearest] run waypoint modify @s color gold
