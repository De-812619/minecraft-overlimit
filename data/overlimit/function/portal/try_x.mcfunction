execute if score #portal_lit overlimit.const matches 1 run return fail
execute unless function overlimit:portal/frame_x run return fail
execute if entity @e[type=minecraft:marker,tag=overlimit.bw_portal_x,distance=..3] run return fail
execute unless block ~ ~ ~ #minecraft:replaceable run return fail
execute unless block ~1 ~ ~ #minecraft:replaceable run return fail
execute unless block ~ ~1 ~ #minecraft:replaceable run return fail
execute unless block ~1 ~1 ~ #minecraft:replaceable run return fail
execute unless block ~ ~2 ~ #minecraft:replaceable run return fail
execute unless block ~1 ~2 ~ #minecraft:replaceable run return fail
function overlimit:portal/place_x
scoreboard players set #portal_lit overlimit.const 1
