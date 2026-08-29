function overlimit:portal/release
tag @s remove overlimit.portal_arrive
tag @s remove overlimit.to_bw
tag @s remove overlimit.to_ow
tag @s remove overlimit.in_bw
scoreboard players set @s overlimit.portal_charge 0
scoreboard players set @s overlimit.portal_wait 0
scoreboard players set @s overlimit.portal_cd 40
