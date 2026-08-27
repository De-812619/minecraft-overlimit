scoreboard players set #cc_hit overlimit.const 0
scoreboard players set #cc_idx overlimit.const 0
scoreboard players set #cc_len overlimit.const 0
execute store result score #cc_len overlimit.const run data get storage overlimit:cc cleared
execute if score #cc_idx overlimit.const < #cc_len overlimit.const run function overlimit:city_clamp/is_cleared_step
execute if score #cc_hit overlimit.const matches 1 run return 1
return 0
