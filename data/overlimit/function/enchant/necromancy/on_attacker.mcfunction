# @s = attacking player (necromancy). Find just-hit mob and stash / lethal-spawn.
tag @s add overlimit.necro_attacker
execute as @e[type=#overlimit:can_be_danger,tag=!overlimit.summon,tag=!overlimit.elite,tag=!overlimit.necro,distance=..8,nbt={HurtTime:10s},limit=1,sort=nearest] at @s run function overlimit:enchant/necromancy/process_victim
execute unless entity @s[scores={overlimit.necro_pending=1..}] as @e[type=#overlimit:can_be_danger,tag=!overlimit.summon,tag=!overlimit.elite,tag=!overlimit.necro,distance=..8,limit=1,sort=nearest] at @s run function overlimit:enchant/necromancy/process_victim_hurt
tag @s remove overlimit.necro_attacker
