summon minecraft:marker ~ ~ ~ {Tags:["overlimit.bw_yh"]}
execute store result score #land_surf overlimit.const run data get entity @n[type=minecraft:marker,tag=overlimit.bw_yh,distance=..1] Pos[1]
kill @n[type=minecraft:marker,tag=overlimit.bw_yh,distance=..1]
