# 毎tickからは呼ばない。粒子と枠は PortalGate。手動で門の前に立って確認するとき用。
particle minecraft:crimson_spore ~ ~1 ~ 0.4 1.0 0.4 0.0 3
execute if entity @s[tag=overlimit.bw_portal_x] align xyz unless function overlimit:portal/check_x run return run function overlimit:portal/break_x
execute if entity @s[tag=overlimit.bw_portal_z] align xyz unless function overlimit:portal/check_z run return run function overlimit:portal/break_z
