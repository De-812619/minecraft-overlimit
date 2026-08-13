scoreboard players add #hd_ray overlimit.const 1
execute if score #hd_ray overlimit.const matches 55.. run return fail

execute unless block ~ ~ ~ #minecraft:replaceable run function overlimit:enchant/hyper_dig/store_hit
execute if score @s overlimit.hd_ok matches 1 run return fail

execute positioned ^ ^ ^0.1 run function overlimit:enchant/hyper_dig/look_ray
