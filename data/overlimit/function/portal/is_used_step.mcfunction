execute store result storage overlimit:portal arg.i int 1 run scoreboard players get #bw_idx overlimit.const
function overlimit:portal/is_used_scan with storage overlimit:portal arg
scoreboard players add #bw_idx overlimit.const 1
execute if score #bw_hit overlimit.const matches 0 if score #bw_idx overlimit.const < #bw_len overlimit.const run function overlimit:portal/is_used_step
