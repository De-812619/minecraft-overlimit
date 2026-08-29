scoreboard players add @s overlimit.portal_wait 1
execute if data storage overlimit:portal origin.x run function overlimit:portal/hold_sky with storage overlimit:portal origin
execute if score @s overlimit.portal_wait matches 80 run tellraw @s {"text":"転移先の陸地を探しています…","color":"gray"}
execute if score @s overlimit.portal_wait matches 200.. run function overlimit:portal/search_stuck
