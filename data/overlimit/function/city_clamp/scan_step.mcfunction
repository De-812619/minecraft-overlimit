execute store result storage overlimit:cc arg.i int 1 run scoreboard players get #cc_oi overlimit.const
function overlimit:city_clamp/scan_pick with storage overlimit:cc arg
scoreboard players add #cc_oi overlimit.const 1
execute if score #cc_oi overlimit.const < #cc_olen overlimit.const run function overlimit:city_clamp/scan_step
