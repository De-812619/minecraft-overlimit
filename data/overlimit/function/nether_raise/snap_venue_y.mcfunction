$execute positioned $(x) $(y) $(z) as @p[predicate=overlimit:in_nether,gamemode=!spectator,distance=..32] store result score #nr_py overlimit.const run data get entity @s Pos[1]
execute store result storage overlimit:nr target.y int 1 run scoreboard players get #nr_py overlimit.const
execute as @e[type=minecraft:marker,tag=overlimit.nr_target,limit=1] store result entity @s Pos[1] double 1 run scoreboard players get #nr_py overlimit.const
execute as @e[type=minecraft:armor_stand,tag=overlimit.nr_waypoint,limit=1] store result entity @s Pos[1] double 1 run scoreboard players get #nr_py overlimit.const
