tag @s remove overlimit.portal_arrive
tag @s remove overlimit.to_bw
tag @s remove overlimit.to_ow
scoreboard players set @s overlimit.portal_wait 0
scoreboard players set @s overlimit.portal_charge 0
scoreboard players set @s overlimit.portal_cd 100
function overlimit:portal/release
function overlimit:portal/nausea_off
execute at @s if dimension overlimit:blood_world run tag @s add overlimit.in_bw
function overlimit:portal/forceload_release
kill @e[type=minecraft:marker,tag=overlimit.bw_fl]
