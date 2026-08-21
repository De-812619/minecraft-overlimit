execute at @s run playsound minecraft:entity.enderman.teleport player @a ~ ~ ~ 1 1
execute at @s run particle minecraft:reverse_portal ~ ~1 ~ 0.35 0.6 0.35 0.15 30
effect give @s minecraft:slow_falling 1 0 true
title @s actionbar {"text":"リスポーン地点へ帰還した","color":"gold"}
return 1
