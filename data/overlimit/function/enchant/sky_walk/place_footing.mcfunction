# Soft footing (carpet): less camera snap than full barrier.
execute align xyz positioned ~0.5 ~-1 ~0.5 unless block ~ ~ ~ #minecraft:replaceable run return fail

execute as @e[type=minecraft:marker,tag=overlimit.sky_plat] at @s run function overlimit:enchant/sky_walk/clear_plat

execute align xyz positioned ~0.5 ~-1 ~0.5 run setblock ~ ~ ~ minecraft:white_carpet keep
execute align xyz positioned ~0.5 ~-1 ~0.5 run summon minecraft:marker ~ ~ ~ {Tags:["overlimit.sky_plat","overlimit.sky_plat_new"]}
execute as @e[type=minecraft:marker,tag=overlimit.sky_plat_new,limit=1,sort=nearest] run function overlimit:enchant/sky_walk/init_plat
