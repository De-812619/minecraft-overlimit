execute unless data storage overlimit:portal scrap_queue[0] run return run function overlimit:portal/scrap_done
data modify storage overlimit:portal scrap set from storage overlimit:portal scrap_queue[0]
data remove storage overlimit:portal scrap_queue[0]
scoreboard players set #bw_scrap_wait overlimit.const 0
function overlimit:portal/scrap_queued_one with storage overlimit:portal scrap
