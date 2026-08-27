scoreboard players set #nr_hit overlimit.const 0
scoreboard players set #nr_idx overlimit.const 0
scoreboard players set #nr_len overlimit.const 0
execute store result score #nr_len overlimit.const run data get storage overlimit:nr cleared
execute if score #nr_idx overlimit.const < #nr_len overlimit.const run function overlimit:nether_raise/is_cleared_step
execute if score #nr_hit overlimit.const matches 1 run return 1
return 0
