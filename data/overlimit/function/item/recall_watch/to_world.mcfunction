data modify storage overlimit:recall dim set value "minecraft:overworld"
execute store result storage overlimit:recall x int 1 run scoreboard players get #bw_spawn_x overlimit.const
execute store result storage overlimit:recall y int 1 run scoreboard players get #bw_spawn_y overlimit.const
execute store result storage overlimit:recall z int 1 run scoreboard players get #bw_spawn_z overlimit.const
function overlimit:item/recall_watch/tp with storage overlimit:recall
