scoreboard players set @s overlimit.portal_wait 0
scoreboard players set @s overlimit.portal_charge 0
scoreboard players set @s overlimit.portal_cd 60
effect clear @s minecraft:nausea
stopsound @s player minecraft:block.portal.trigger
execute if predicate overlimit:in_blood_world run function overlimit:portal/mark_bw
tag @s remove overlimit.portal_arrive
execute at @s run forceload remove ~-48 ~-48 ~48 ~48
execute as @e[type=minecraft:marker,tag=overlimit.bw_fl] at @s run forceload remove ~-192 ~-192 ~192 ~192
kill @e[type=minecraft:marker,tag=overlimit.bw_fl]
