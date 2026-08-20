execute if score #bw_scrapping overlimit.const matches 1 run return fail
execute if score #bw_occupied overlimit.const matches 0 unless score #bw_pending overlimit.const matches 1 unless data storage overlimit:portal gates[0] run return fail
execute if score #bw_gate overlimit.const matches 1 run function overlimit:portal/remember_origin
scoreboard players set #bw_gate overlimit.const 0
scoreboard players set #bw_pending overlimit.const 0
scoreboard players set #bw_sess overlimit.const 0
scoreboard players set #bw_occupied overlimit.const 0
scoreboard players set #bw_spread overlimit.const 0
scoreboard players reset * overlimit.bw_has
execute as @e[tag=overlimit.bw_search] at @s run forceload remove ~-160 ~-160 ~160 ~160
kill @e[tag=overlimit.bw_search]
execute if data storage overlimit:portal origin.x run function overlimit:portal/unload_origin with storage overlimit:portal origin
data remove storage overlimit:portal origin
execute if data storage overlimit:portal pend.x run function overlimit:portal/unload_pend with storage overlimit:portal pend
data remove storage overlimit:portal pend
execute as @e[type=minecraft:marker,tag=overlimit.bw_portal] at @s if dimension overlimit:blood_world run function overlimit:portal/scrap_here
execute unless data storage overlimit:portal gates[0] run return fail
scoreboard players set #bw_scrapping overlimit.const 1
data modify storage overlimit:portal scrap_queue set from storage overlimit:portal gates
data modify storage overlimit:portal gates set value []
function overlimit:portal/scrap_queue
