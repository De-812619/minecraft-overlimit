execute if score #nr_active overlimit.const matches 1 run return run tellraw @s {"translate": "overlimit.cmd.nr_active","color":"red"}
execute store result score #nr_diff overlimit.const run difficulty
execute if score #nr_diff overlimit.const matches 0 run return run tellraw @s {"translate": "overlimit.cmd.peaceful_no","color":"red"}
execute unless predicate overlimit:in_nether run return run tellraw @s {"translate": "overlimit.cmd.need_nether","color":"red"}
execute unless predicate overlimit:in_fortress unless predicate overlimit:in_bastion run return run tellraw @s {"translate": "overlimit.cmd.need_nr_struct","color":"red"}
tag @s remove overlimit.nr_tried
function overlimit:nether_raise/try_enter
execute unless score #nr_active overlimit.const matches 1 run return run tellraw @s {"translate": "overlimit.cmd.start_failed","color":"red"}
tellraw @s {"translate": "overlimit.cmd.nr_force_start","color":"gold"}
