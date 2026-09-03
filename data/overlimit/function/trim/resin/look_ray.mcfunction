scoreboard players add #look_ray overlimit.const 1
execute if score #look_ray overlimit.const matches 25.. run return fail
execute unless block ~ ~ ~ #minecraft:replaceable run return fail
execute as @e[type=#overlimit:trim_look_stop,tag=!overlimit.summon,distance=..1.2,limit=1,sort=nearest] run return run function overlimit:trim/resin/freeze
execute positioned ^ ^ ^0.5 run function overlimit:trim/resin/look_ray
