execute as @e[type=minecraft:armor_stand,tag=overlimit.bw_search,limit=1] at @s run tp @a[tag=overlimit.portal_arrive,tag=overlimit.to_bw] ~ ~ ~
execute as @e[type=minecraft:armor_stand,tag=overlimit.bw_search,limit=1] at @s run forceload remove ~-160 ~-160 ~160 ~160
execute as @a[tag=overlimit.portal_arrive,tag=overlimit.to_bw] at @s run function overlimit:portal/stand_front
execute as @a[tag=overlimit.portal_arrive,tag=overlimit.to_bw] run function overlimit:portal/arrive_done
kill @e[type=minecraft:armor_stand,tag=overlimit.bw_search]
scoreboard players set #bw_pending overlimit.const 0
scoreboard players set #bw_spread overlimit.const 0
execute if data storage overlimit:portal origin.x run function overlimit:portal/unload_origin with storage overlimit:portal origin
