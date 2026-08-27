execute store result storage overlimit:cc arg.i int 1 run scoreboard players get #cc_idx overlimit.const
function overlimit:city_clamp/is_cleared_scan with storage overlimit:cc arg
scoreboard players add #cc_idx overlimit.const 1
execute if score #cc_hit overlimit.const matches 0 if score #cc_idx overlimit.const < #cc_len overlimit.const run function overlimit:city_clamp/is_cleared_step
