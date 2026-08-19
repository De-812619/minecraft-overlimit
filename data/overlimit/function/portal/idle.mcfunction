particle minecraft:crimson_spore ~ ~1 ~ 0.4 1.0 0.4 0.0 3
execute if entity @s[tag=overlimit.bw_portal_x] align xyz unless function overlimit:portal/check_x run return run function overlimit:portal/break_x
execute if entity @s[tag=overlimit.bw_portal_z] align xyz unless function overlimit:portal/check_z run return run function overlimit:portal/break_z
