# テスト用: Phase6 エンチャント付き装備（26.2: enchantments は flat map）
give @s minecraft:netherite_boots[minecraft:enchantments={"overlimit:cat_foot":1}]
tellraw @s [{"translate": "overlimit.cmd.prefix","color":"gold"},{"translate": "overlimit.cmd.gave_phase6","color":"gray"}]
