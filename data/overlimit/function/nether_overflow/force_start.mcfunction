execute if score #no_active overlimit.const matches 1 run return run tellraw @s {"translate": "overlimit.cmd.no_active","color":"red"}
execute if score #no_nethering overlimit.const matches 1 run return run tellraw @s {"translate": "overlimit.cmd.no_nethering","color":"red"}
execute if score #bm_active overlimit.const matches 1 run return run tellraw @s {"translate": "overlimit.cmd.during_bm","color":"red"}
execute store result score #no_diff overlimit.const run difficulty
execute if score #no_diff overlimit.const matches 0 run return run tellraw @s {"translate": "overlimit.cmd.peaceful_no","color":"red"}
execute unless predicate overlimit:in_overworld run return run tellraw @s {"translate": "overlimit.cmd.need_overworld","color":"red"}
execute at @s run function overlimit:nether_overflow/scan_near
execute as @e[type=minecraft:marker,tag=overlimit.no_gate] at @s run function overlimit:nether_overflow/remember_gate
execute unless data storage overlimit:no gates[0] run return run tellraw @s {"translate": "overlimit.cmd.no_no_portal","color":"red"}
function overlimit:nether_overflow/start
execute unless score #no_active overlimit.const matches 1 run return run tellraw @s {"translate": "overlimit.cmd.no_start_fail","color":"red"}
tellraw @s {"translate": "overlimit.cmd.no_force_start","color":"gold"}
