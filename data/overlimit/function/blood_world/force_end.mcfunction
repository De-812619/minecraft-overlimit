execute unless score #bw_active overlimit.const matches 1 run return run tellraw @s {"translate": "overlimit.cmd.bw_inactive","color":"red"}
tellraw @s {"translate": "overlimit.cmd.bw_force_end","color":"gold"}
execute in overlimit:blood_world run function overlimit:blood_world/end
