fill ~-1 ~-1 ~ ~2 ~-1 ~ minecraft:crying_obsidian
fill ~-1 ~3 ~ ~2 ~3 ~ minecraft:crying_obsidian
fill ~-1 ~ ~ ~-1 ~2 ~ minecraft:crying_obsidian
fill ~2 ~ ~ ~2 ~2 ~ minecraft:crying_obsidian
function overlimit:portal/place_x
execute if score #bw_no_tp overlimit.const matches 1 run return run function overlimit:portal/mark_session_here
function overlimit:portal/stand_front
function overlimit:portal/mark_session_here
