data modify storage overlimit:cc cleared append value {x:0,z:0,kind_id:0,kind:""}
data modify storage overlimit:cc cleared[-1].kind set from storage overlimit:cc target.kind
data modify storage overlimit:cc cleared[-1].kind_id set from storage overlimit:cc target.kind_id
data modify storage overlimit:cc cleared[-1].x set from storage overlimit:cc target.origin_x
data modify storage overlimit:cc cleared[-1].z set from storage overlimit:cc target.origin_z
