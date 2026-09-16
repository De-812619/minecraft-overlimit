# テスト用: Phase5 エンチャント付き装備（26.2: enchantments は flat map）
give @s minecraft:netherite_helmet[minecraft:enchantments={"overlimit:midas_table":1}]
give @s minecraft:cooked_beef 16
give @s minecraft:bread 16
give @s minecraft:apple 16
give @s minecraft:golden_apple 4
tellraw @s [{"translate": "overlimit.cmd.prefix","color":"gold"},{"translate": "overlimit.cmd.gave_phase5","color":"gray"}]
