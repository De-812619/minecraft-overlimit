execute if score #bw_warm overlimit.const matches 1 run return fail
execute if data storage overlimit:portal origin.x run function overlimit:portal/scrap_near with storage overlimit:portal origin
execute if data storage overlimit:portal origin.x run function overlimit:portal/unload_pend with storage overlimit:portal origin
scoreboard players set #bw_preload overlimit.const 0
scoreboard players set #bw_gate overlimit.const 0
scoreboard players set #bw_place_wait overlimit.const 0
scoreboard players set #bw_no_tp overlimit.const 0
