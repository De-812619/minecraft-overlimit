execute store result storage overlimit:nr arg.i int 1 run scoreboard players get #nr_idx overlimit.const
function overlimit:nether_raise/is_cleared_scan with storage overlimit:nr arg
scoreboard players add #nr_idx overlimit.const 1
execute if score #nr_hit overlimit.const matches 0 if score #nr_idx overlimit.const < #nr_len overlimit.const run function overlimit:nether_raise/is_cleared_step
