# @s = gravity field marker
scoreboard players remove @s overlimit.hg_life 1
execute if score @s overlimit.hg_life matches ..0 run particle minecraft:portal ~ ~0.5 ~ 0.4 0.4 0.4 0.2 20
execute if score @s overlimit.hg_life matches ..0 run kill @s
execute if score @s overlimit.hg_life matches ..0 run return fail

particle minecraft:portal ~ ~0.5 ~ 1.2 0.4 1.2 0.15 8
particle minecraft:witch ~ ~0.2 ~ 1.0 0.1 1.0 0.0 3

tag @s add overlimit.hg_center
execute as @e[type=#overlimit:hostile,tag=!overlimit.summon,distance=..3] run effect give @s minecraft:slowness 1 255 true
execute as @e[type=#overlimit:hostile,tag=!overlimit.summon,distance=..3] at @s facing entity @n[tag=overlimit.hg_center] feet positioned ^ ^ ^0.45 if block ~ ~ ~ #minecraft:replaceable if block ~ ~1 ~ #minecraft:replaceable run tp @s ~ ~ ~
tag @s remove overlimit.hg_center
