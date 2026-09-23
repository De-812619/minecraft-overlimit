execute unless score #no_active overlimit.const matches 1 unless score #no_nethering overlimit.const matches 1 run return run tellraw @s {"translate": "overlimit.cmd.no_inactive","color":"red"}
tellraw @s {"translate": "overlimit.cmd.no_force_end","color":"gold"}
execute if score #no_nethering overlimit.const matches 1 run function overlimit:nether_overflow/netherize_finish
execute if score #no_active overlimit.const matches 1 run function overlimit:nether_overflow/end
