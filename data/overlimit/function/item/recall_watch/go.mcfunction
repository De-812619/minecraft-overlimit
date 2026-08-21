playsound minecraft:item.chorus_fruit.teleport player @a ~ ~ ~ 1 1
particle minecraft:portal ~ ~1 ~ 0.35 0.6 0.35 0.4 40
execute if data entity @s respawn.pos run return run function overlimit:item/recall_watch/to_bed
function overlimit:item/recall_watch/to_world
