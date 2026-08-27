$data modify storage overlimit:nr scan set from storage overlimit:nr origins[$(i)]
execute store result score #nr_offx overlimit.const run data get storage overlimit:nr scan.ox
execute store result score #nr_offz overlimit.const run data get storage overlimit:nr scan.oz
data modify storage overlimit:nr scan.kind set from storage overlimit:nr scan_kind
function overlimit:nether_raise/scan_at with storage overlimit:nr scan
function overlimit:nether_raise/scan_eval
