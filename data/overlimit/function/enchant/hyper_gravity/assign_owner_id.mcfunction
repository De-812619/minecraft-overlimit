# Ensure player has a unique hyper-gravity owner id (1+).
execute if score @s overlimit.hg_owner matches 1.. run return 1
scoreboard players add #hg_id_seq overlimit.const 1
scoreboard players operation @s overlimit.hg_owner = #hg_id_seq overlimit.const
