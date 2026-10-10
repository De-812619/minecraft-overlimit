# テスト用: 連撃・バーサーカー・重力軽減
give @s minecraft:netherite_sword[minecraft:enchantments={"overlimit:combo":1}]
give @s minecraft:netherite_axe[minecraft:enchantments={"overlimit:combo":1}]
give @s minecraft:netherite_chestplate[minecraft:enchantments={"overlimit:berserker":1}]
give @s minecraft:netherite_leggings[minecraft:enchantments={"overlimit:light_gravity":1}]
tellraw @s [{"translate": "overlimit.cmd.prefix","color":"gold"},{"translate": "overlimit.cmd.gave_phase7","color":"gray"}]
