execute unless score #no_active overlimit.const matches 1 run return run tellraw @s {"translate": "overlimit.cmd.no_inactive","color":"red"}
tellraw @s {"translate": "overlimit.cmd.no_force_timeout","color":"gold"}
function overlimit:nether_overflow/end_timeout
