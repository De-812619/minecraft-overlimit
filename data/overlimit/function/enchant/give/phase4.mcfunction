# テスト用: Phase4 エンチャント付き装備（26.2: enchantments は flat map）
give @s minecraft:elytra[minecraft:enchantments={"overlimit:wind_blessing":1}]
give @s minecraft:elytra
give @s minecraft:enchanted_book[minecraft:stored_enchantments={"overlimit:wind_blessing":1,"minecraft:vanishing_curse":1}]
give @s minecraft:firework_rocket 64
tellraw @s [{"translate": "overlimit.cmd.prefix","color":"gold"},{"translate": "overlimit.cmd.gave_phase4","color":"gray"}]
