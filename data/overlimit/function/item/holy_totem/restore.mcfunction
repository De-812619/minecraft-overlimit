tag @s remove overlimit.ht_restore
execute if items entity @s weapon.mainhand *[custom_data~{overlimit:{holy_totem_spent:true}}] run return run loot replace entity @s weapon.mainhand loot overlimit:holy_totem
execute if items entity @s weapon.offhand *[custom_data~{overlimit:{holy_totem_spent:true}}] run return run loot replace entity @s weapon.offhand loot overlimit:holy_totem
clear @s *[custom_data~{overlimit:{holy_totem_spent:true}}] 1
loot give @s loot overlimit:holy_totem
