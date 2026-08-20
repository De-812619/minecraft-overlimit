# テスト用: Phase6 エンチャント付き装備（26.2: enchantments は flat map）
give @s minecraft:netherite_boots[minecraft:enchantments={"overlimit:cat_foot":1}]
tellraw @s [{"text":"[overlimit] ","color":"gold"},{"text":"Phase6 テスト装備を付与しました（猫足ブーツ）","color":"gray"}]
