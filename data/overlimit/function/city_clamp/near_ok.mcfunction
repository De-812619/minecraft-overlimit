scoreboard players set #cc_near_p overlimit.const 0
execute summon minecraft:marker run function overlimit:city_clamp/near_scan
execute if score #cc_near_p overlimit.const matches 1 run return 1
return fail
