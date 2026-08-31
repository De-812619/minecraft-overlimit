execute store result score #cc_diff overlimit.const run difficulty
execute if score #cc_diff overlimit.const matches 0 run return fail
execute if score #cc_active overlimit.const matches 1 run return fail
execute if entity @e[type=minecraft:ender_dragon] run return fail
execute unless entity @a[predicate=overlimit:in_the_end,gamemode=!spectator] run return fail
execute as @a[tag=overlimit.cc_tried] at @s unless predicate overlimit:in_end_city run tag @s remove overlimit.cc_tried
execute as @a[predicate=overlimit:in_the_end,gamemode=!spectator,tag=!overlimit.cc_tried] at @s if predicate overlimit:in_end_city run function overlimit:city_clamp/try_enter
execute if score #cc_active overlimit.const matches 1 run return 1
return fail
