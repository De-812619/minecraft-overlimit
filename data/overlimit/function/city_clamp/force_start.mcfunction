execute if score #cc_active overlimit.const matches 1 run return run tellraw @s {"translate": "overlimit.cmd.cc_active","color":"red"}
execute store result score #cc_diff overlimit.const run difficulty
execute if score #cc_diff overlimit.const matches 0 run return run tellraw @s {"translate": "overlimit.cmd.peaceful_no","color":"red"}
execute if entity @e[type=minecraft:ender_dragon] run return run tellraw @s {"translate": "overlimit.cmd.dragon_alive","color":"red"}
execute unless predicate overlimit:in_the_end run return run tellraw @s {"translate": "overlimit.cmd.need_end","color":"red"}
execute unless predicate overlimit:in_end_city run return run tellraw @s {"translate": "overlimit.cmd.need_end_city","color":"red"}
tag @s remove overlimit.cc_tried
function overlimit:city_clamp/try_enter
execute unless score #cc_active overlimit.const matches 1 run return run tellraw @s {"translate": "overlimit.cmd.start_failed","color":"red"}
tellraw @s {"translate": "overlimit.cmd.cc_force_start","color":"gold"}
