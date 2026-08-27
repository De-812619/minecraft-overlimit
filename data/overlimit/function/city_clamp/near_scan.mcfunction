execute store result score #cc_cx overlimit.const run data get entity @s Pos[0]
execute store result score #cc_cz overlimit.const run data get entity @s Pos[2]
execute as @a[predicate=overlimit:in_the_end,gamemode=!spectator,distance=..48] run function overlimit:city_clamp/near_one
kill @s
