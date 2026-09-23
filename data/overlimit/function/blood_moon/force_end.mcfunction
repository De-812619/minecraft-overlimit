execute unless score #bm_active overlimit.const matches 1 run return run tellraw @s {"translate": "overlimit.cmd.bm_inactive","color":"red"}
tellraw @s {"translate": "overlimit.cmd.bm_force_end","color":"gold"}
function overlimit:blood_moon/end
