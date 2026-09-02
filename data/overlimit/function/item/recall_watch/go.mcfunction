playsound minecraft:item.chorus_fruit.teleport player @a ~ ~ ~ 1 1
particle minecraft:portal ~ ~1 ~ 0.35 0.6 0.35 0.4 40
execute if entity @s[tag=overlimit.portal_arrive] run function overlimit:portal/clear_arrive
function overlimit:portal/release
scoreboard players set @s overlimit.portal_charge 0
execute if data entity @s respawn.pos run return run function overlimit:item/recall_watch/to_bed
function overlimit:item/recall_watch/to_world
