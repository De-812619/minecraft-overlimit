# テスト用: Phase5 エンチャント付き装備（26.2: enchantments は flat map）
give @s minecraft:netherite_helmet[minecraft:enchantments={"overlimit:midas_table":1}]
give @s minecraft:cooked_beef 16
give @s minecraft:bread 16
give @s minecraft:apple 16
give @s minecraft:golden_apple 4
tellraw @s [{"text":"[overlimit] ","color":"gold"},{"text":"Phase5 テスト装備を付与しました（ミダスの食卓ヘルメット／食料）","color":"gray"}]
