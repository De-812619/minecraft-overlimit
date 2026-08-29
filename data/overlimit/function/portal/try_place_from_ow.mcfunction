scoreboard players add @s overlimit.portal_wait 1
execute if score @s overlimit.portal_wait matches 1 run function overlimit:portal/hold_player
function overlimit:portal/status_bar
execute if score @s overlimit.portal_wait matches 40 run tellraw @s {"text":"転移先の陸地を探しています…","color":"gray"}
execute if score @s overlimit.portal_wait matches 600.. run return run function overlimit:portal/search_stuck
execute if data storage overlimit:portal origin.x run function overlimit:portal/try_place_at with storage overlimit:portal origin
