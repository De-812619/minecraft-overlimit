execute unless data storage overlimit:portal pend.x run return fail
scoreboard players add @s overlimit.portal_wait 1
execute if score @s overlimit.portal_wait matches 80.. run return run function overlimit:portal/reroll_dest
function overlimit:portal/tp_search with storage overlimit:portal pend
