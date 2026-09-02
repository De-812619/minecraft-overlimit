execute store result score #nr_diff overlimit.const run difficulty
execute if score #nr_diff overlimit.const matches 0 run return fail
execute if score #nr_active overlimit.const matches 1 run return fail
execute unless entity @a[predicate=overlimit:in_nether,gamemode=!spectator] run return fail
execute as @a[tag=overlimit.nr_tried] at @s unless predicate overlimit:in_fortress unless predicate overlimit:in_bastion run tag @s remove overlimit.nr_tried
execute as @a[predicate=overlimit:in_nether,gamemode=!spectator,tag=!overlimit.nr_tried] at @s if predicate overlimit:in_fortress run function overlimit:nether_raise/try_enter
execute unless score #nr_active overlimit.const matches 1 as @a[predicate=overlimit:in_nether,gamemode=!spectator,tag=!overlimit.nr_tried] at @s if predicate overlimit:in_bastion run function overlimit:nether_raise/try_enter
execute if score #nr_active overlimit.const matches 1 run return 1
return fail
