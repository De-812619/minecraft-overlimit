# @s = hit victim. Spawn gravity field at victim (max 1 field world-wide).
kill @e[type=minecraft:marker,tag=overlimit.hg_field]
execute at @s run summon minecraft:marker ~ ~ ~ {Tags:["overlimit.hg_field"]}
execute at @s as @e[type=minecraft:marker,tag=overlimit.hg_field,limit=1,sort=nearest,distance=..2] run scoreboard players set @s overlimit.hg_life 60
execute at @s run particle minecraft:portal ~ ~1 ~ 0.6 0.6 0.6 0.4 40
