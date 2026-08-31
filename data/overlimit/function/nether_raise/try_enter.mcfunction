execute if score #nr_active overlimit.const matches 1 run return fail
execute store result score #nr_diff overlimit.const run difficulty
execute if score #nr_diff overlimit.const matches 0 run return fail
tag @s add overlimit.nr_tried
execute if predicate overlimit:in_fortress run return run function overlimit:nether_raise/try_enter_fortress
execute if predicate overlimit:in_bastion run return run function overlimit:nether_raise/try_enter_bastion
return fail
