execute if score #bw_pending overlimit.const matches 0 run return fail
execute if entity @e[tag=overlimit.bw_search] run return fail
function overlimit:portal/store_origin
function overlimit:portal/start_search_at with storage overlimit:portal origin
execute unless entity @e[tag=overlimit.bw_search] run schedule function overlimit:portal/start_search 2t
