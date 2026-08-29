tag @s add overlimit.portal_arrive
scoreboard players set @s overlimit.portal_wait 0
execute in minecraft:overworld positioned as @s run forceload add ~-48 ~-48 ~48 ~48
execute in minecraft:overworld positioned as @s run tp @s ~ ~ ~
schedule function overlimit:portal/arrive 1t replace
