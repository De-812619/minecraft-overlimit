data modify storage overlimit:nr cleared append value {x:0,z:0,kind_id:0,kind:""}
data modify storage overlimit:nr cleared[-1].kind set from storage overlimit:nr target.kind
data modify storage overlimit:nr cleared[-1].kind_id set from storage overlimit:nr target.kind_id
data modify storage overlimit:nr cleared[-1].x set from storage overlimit:nr target.origin_x
data modify storage overlimit:nr cleared[-1].z set from storage overlimit:nr target.origin_z
