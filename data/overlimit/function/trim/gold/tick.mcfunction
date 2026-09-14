execute if score @s overlimit.trim.anger matches 1.. run return fail
execute as @e[type=minecraft:piglin,distance=..16] run function overlimit:trim/gold/clear_ai
