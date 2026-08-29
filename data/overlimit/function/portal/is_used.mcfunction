scoreboard players set #bw_hit overlimit.const 0
scoreboard players set #bw_idx overlimit.const 0
execute store result score #bw_len overlimit.const run data get storage overlimit:portal used
execute if score #bw_idx overlimit.const < #bw_len overlimit.const run function overlimit:portal/is_used_step
execute if score #bw_hit overlimit.const matches 1 run return 1
return 0
