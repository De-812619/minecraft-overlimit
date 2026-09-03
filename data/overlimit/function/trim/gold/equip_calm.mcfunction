execute if data entity @s equipment.head.components."minecraft:custom_data".overlimit.trim_gold_swap run return fail
execute unless data entity @s equipment.head.id run return fail
execute if items entity @s armor.head minecraft:elytra run return fail
execute if items entity @s armor.head #minecraft:piglin_safe_armor run return fail
execute if items entity @s armor.head minecraft:netherite_helmet run function overlimit:trim/gold/force_netherite_head
execute unless items entity @s armor.head #minecraft:piglin_safe_armor at @s run function overlimit:trim/gold/swap_to_gold
execute at @s if items entity @s armor.head #minecraft:piglin_safe_armor as @e[type=minecraft:piglin,distance=..24] run function overlimit:trim/gold/drop_hunt
