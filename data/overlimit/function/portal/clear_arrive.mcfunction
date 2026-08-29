function overlimit:portal/release
tag @s remove overlimit.portal_arrive
tag @s remove overlimit.to_bw
tag @s remove overlimit.to_ow
tag @s remove overlimit.in_bw
scoreboard players set @s overlimit.portal_charge 0
scoreboard players set @s overlimit.portal_wait 0
scoreboard players set @s overlimit.portal_cd 40
execute unless entity @a[tag=overlimit.portal_arrive] run scoreboard players set #bw_pending overlimit.const 0
execute unless entity @a[tag=overlimit.portal_arrive] run scoreboard players set #bw_preload overlimit.const 0
execute unless entity @a[tag=overlimit.portal_arrive] run scoreboard players set #bw_warm overlimit.const 0
