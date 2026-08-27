execute store result score #nr_cx overlimit.const run data get entity @s Pos[0]
execute store result score #nr_cz overlimit.const run data get entity @s Pos[2]
execute as @a[predicate=overlimit:in_nether,gamemode=!spectator,distance=..48] run function overlimit:nether_raise/near_one
kill @s
