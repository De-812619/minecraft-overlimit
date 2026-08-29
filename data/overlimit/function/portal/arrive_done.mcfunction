tag @s remove overlimit.portal_arrive
tag @s remove overlimit.to_bw
tag @s remove overlimit.to_ow
scoreboard players set @s overlimit.portal_wait 0
scoreboard players set @s overlimit.portal_charge 0
scoreboard players set @s overlimit.portal_cd 100
function overlimit:portal/release
execute at @s if dimension overlimit:blood_world run tag @s add overlimit.in_bw
execute if predicate overlimit:in_blood_world run function overlimit:portal/mark_session
scoreboard players set #bw_warm overlimit.const 0
scoreboard players set #bw_warm_fail overlimit.const 0
execute at @s run forceload remove ~-192 ~-192 ~192 ~192
execute as @e[type=minecraft:marker,tag=overlimit.bw_fl] at @s run forceload remove ~-192 ~-192 ~192 ~192
kill @e[type=minecraft:marker,tag=overlimit.bw_fl]
