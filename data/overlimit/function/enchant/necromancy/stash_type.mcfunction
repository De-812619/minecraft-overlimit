# @s = attacker. #necro_type already set from victim encode.
scoreboard players operation @s overlimit.necro_type = #necro_type overlimit.const
scoreboard players operation @s overlimit.mob_prev = @s overlimit.mob_kills
scoreboard players set @s overlimit.necro_pending 40
