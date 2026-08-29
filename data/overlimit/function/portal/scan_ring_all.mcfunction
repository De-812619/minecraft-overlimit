data modify storage overlimit:portal scan_kind set value "#minecraft:village"
function overlimit:portal/scan_ring
execute if score #bw_found overlimit.const matches 1 run return 1
data modify storage overlimit:portal scan_kind set value "minecraft:pillager_outpost"
function overlimit:portal/scan_ring
execute if score #bw_found overlimit.const matches 1 run return 1
data modify storage overlimit:portal scan_kind set value "overlimit:bastion_remnant"
function overlimit:portal/scan_ring
return 1
