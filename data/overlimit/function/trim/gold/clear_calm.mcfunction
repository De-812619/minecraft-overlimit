execute unless data entity @s equipment.head.components."minecraft:custom_data".overlimit.trim_gold_swap run return fail
execute at @s run function overlimit:trim/gold/swap_from_gold
execute if items entity @s armor.body *[custom_data~{overlimit:{trim_gold_calm:true}}] run item replace entity @s armor.body with minecraft:air
