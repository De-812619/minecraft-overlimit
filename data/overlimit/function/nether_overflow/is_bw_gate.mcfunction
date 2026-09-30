execute if entity @e[type=minecraft:marker,tag=overlimit.bw_portal,distance=..6] run return 1
execute if block ~-1 ~ ~ minecraft:crying_obsidian run return 1
execute if block ~1 ~ ~ minecraft:crying_obsidian run return 1
execute if block ~ ~ ~-1 minecraft:crying_obsidian run return 1
execute if block ~ ~ ~1 minecraft:crying_obsidian run return 1
execute if block ~ ~1 ~ minecraft:crying_obsidian run return 1
execute if block ~ ~-1 ~ minecraft:crying_obsidian run return 1
return fail
