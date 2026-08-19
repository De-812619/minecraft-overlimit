tag @s add overlimit.portal_arrive
scoreboard players set @s overlimit.portal_wait 0
execute in minecraft:overworld positioned as @s run forceload add ~-192 ~-192 ~192 ~192
execute in minecraft:overworld positioned as @s run tp @s ~ ~ ~
function overlimit:portal/nausea_off
schedule function overlimit:portal/arrive 2t
