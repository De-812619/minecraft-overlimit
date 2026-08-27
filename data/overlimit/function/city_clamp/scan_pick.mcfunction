$data modify storage overlimit:cc scan set from storage overlimit:cc origins[$(i)]
execute store result score #cc_offx overlimit.const run data get storage overlimit:cc scan.ox
execute store result score #cc_offz overlimit.const run data get storage overlimit:cc scan.oz
data modify storage overlimit:cc scan.kind set from storage overlimit:cc target.kind
function overlimit:city_clamp/scan_at with storage overlimit:cc scan
function overlimit:city_clamp/scan_eval
