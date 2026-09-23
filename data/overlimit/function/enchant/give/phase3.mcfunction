# テスト用: Phase3 エンチャント付き装備（26.2: enchantments は flat map）
give @s minecraft:netherite_sword[minecraft:enchantments={"overlimit:hyper_gravity":1}]
give @s minecraft:netherite_axe[minecraft:enchantments={"overlimit:hyper_gravity":1}]
give @s minecraft:netherite_sword[minecraft:enchantments={"overlimit:necromancy":1}]
give @s minecraft:netherite_boots[minecraft:enchantments={"overlimit:sky_walk":1}]
tellraw @s [{"translate": "overlimit.cmd.prefix","color":"gold"},{"translate": "overlimit.cmd.gave_phase3","color":"gray"}]
