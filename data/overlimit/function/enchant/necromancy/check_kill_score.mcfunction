# @s = player with pending necro type. Spawn if mob kill count increased.
execute unless score @s overlimit.necro_pending matches 1.. run return fail
execute unless score @s overlimit.necro_type matches 1.. run return fail
execute if score @s overlimit.necro_cd matches 1.. run return fail
execute unless score @s overlimit.mob_kills > @s overlimit.mob_prev run return fail
execute at @s run function overlimit:enchant/necromancy/do_spawn
