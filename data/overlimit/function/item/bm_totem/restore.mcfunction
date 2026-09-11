tag @s remove overlimit.bt_restore
execute if items entity @s weapon.mainhand *[custom_data~{overlimit:{bm_totem_spent:true}}] run return run loot replace entity @s weapon.mainhand loot overlimit:bm_totem
execute if items entity @s weapon.offhand *[custom_data~{overlimit:{bm_totem_spent:true}}] run return run loot replace entity @s weapon.offhand loot overlimit:bm_totem
clear @s *[custom_data~{overlimit:{bm_totem_spent:true}}] 1
loot give @s loot overlimit:bm_totem
