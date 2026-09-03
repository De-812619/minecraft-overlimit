data modify entity @s equipment.head.components."minecraft:custom_data" merge value {overlimit:{trim_gold_swap:1b}}
data modify entity @s equipment.head.components."minecraft:custom_data".overlimit.trim_gold_orig set from storage overlimit:trim gold_orig
data modify entity @s equipment.head.components."minecraft:item_model" set from storage overlimit:trim gold_orig
function overlimit:trim/gold/set_asset
data modify entity @s equipment.head.id set value "minecraft:golden_helmet"
