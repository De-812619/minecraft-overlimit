execute if score #portal_lit overlimit.const matches 1 run return fail
scoreboard players add #portal_ray overlimit.const 1
execute if score #portal_ray overlimit.const matches 25.. run return fail
execute if block ~ ~ ~ minecraft:crying_obsidian run return run function overlimit:portal/hit_obsidian
execute positioned ^ ^ ^0.25 run function overlimit:portal/ray
