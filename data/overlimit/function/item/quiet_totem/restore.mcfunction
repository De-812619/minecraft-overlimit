tag @s remove overlimit.qt_restore
execute if items entity @s weapon.mainhand *[custom_data~{overlimit:{quiet_totem_spent:true}}] run return run loot replace entity @s weapon.mainhand loot overlimit:quiet_totem
execute if items entity @s weapon.offhand *[custom_data~{overlimit:{quiet_totem_spent:true}}] run return run loot replace entity @s weapon.offhand loot overlimit:quiet_totem
clear @s *[custom_data~{overlimit:{quiet_totem_spent:true}}] 1
loot give @s loot overlimit:quiet_totem
