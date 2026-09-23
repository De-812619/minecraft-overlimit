scoreboard players set #nr_dbgn overlimit.const 0
execute in minecraft:the_nether as @e[type=minecraft:armor_stand,tag=overlimit.nr_waypoint] run scoreboard players add #nr_dbgn overlimit.const 1
scoreboard players set #nr_dbgr overlimit.const -999
execute in minecraft:the_nether as @e[type=minecraft:armor_stand,tag=overlimit.nr_waypoint,limit=1] store result score #nr_dbgr overlimit.const run attribute @s minecraft:waypoint_transmit_range get
tellraw @s {"translate":"overlimit.dbg.nr.stands","color":"gray","with":[{"score":{"name":"#nr_dbgn","objective":"overlimit.const"},"color":"yellow"},{"score":{"name":"#nr_dbgr","objective":"overlimit.const"},"color":"yellow"},{"score":{"name":"#nr_active","objective":"overlimit.const"},"color":"yellow"}]}
tellraw @s {"translate":"overlimit.dbg.nr.target","color":"gray","with":[{"nbt":"target.x","storage":"overlimit:nr","color":"aqua"},{"nbt":"target.y","storage":"overlimit:nr","color":"aqua"},{"nbt":"target.z","storage":"overlimit:nr","color":"aqua"}]}
execute in minecraft:the_nether as @e[type=minecraft:armor_stand,tag=overlimit.nr_waypoint,limit=1] at @s run tellraw @a {"translate":"overlimit.dbg.nr.pos","color":"gray","with":[{"nbt":"Pos[0]","entity":"@s","color":"green"},{"nbt":"Pos[1]","entity":"@s","color":"green"},{"nbt":"Pos[2]","entity":"@s","color":"green"}]}
