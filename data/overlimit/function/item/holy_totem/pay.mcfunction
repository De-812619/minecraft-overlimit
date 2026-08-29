tag @s remove overlimit.ht_pay
execute if items entity @s weapon.mainhand *[custom_data~{overlimit:{holy_totem_spent:true}}] run return run item replace entity @s weapon.mainhand with minecraft:air
execute if items entity @s weapon.offhand *[custom_data~{overlimit:{holy_totem_spent:true}}] run return run item replace entity @s weapon.offhand with minecraft:air
clear @s *[custom_data~{overlimit:{holy_totem_spent:true}}] 1
