# Ensure player has a unique necro owner id (1+)
execute if score @s overlimit.necro_owner matches 1.. run return 1
scoreboard players add #necro_id_seq overlimit.const 1
scoreboard players operation @s overlimit.necro_owner = #necro_id_seq overlimit.const
