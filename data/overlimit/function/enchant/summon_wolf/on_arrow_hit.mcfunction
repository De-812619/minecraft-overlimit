# @s = hit victim (arrow damage). Summon wolf at victim for the attacking player.
tag @s add overlimit.hit_loc
execute on attacker run function overlimit:enchant/summon_wolf/spawn_as_owner
tag @s remove overlimit.hit_loc
