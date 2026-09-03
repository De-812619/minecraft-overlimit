# storage overlimit:trim slot = head|chest|legs|feet
data modify storage overlimit:trim raw set value ""
$data modify storage overlimit:trim raw set from entity @s equipment.$(slot).components."minecraft:trim".material
function overlimit:trim/count_from_raw
