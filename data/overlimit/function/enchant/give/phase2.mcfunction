# テスト用: Phase2 エンチャント付き装備（26.2: enchantments は flat map）
give @s minecraft:netherite_axe[minecraft:enchantments={"overlimit:impact":1}]
give @s minecraft:bow[minecraft:enchantments={"overlimit:summon_wolf":1}]
give @s minecraft:crossbow[minecraft:enchantments={"overlimit:summon_wolf":1}]
give @s minecraft:netherite_pickaxe[minecraft:enchantments={"overlimit:smelting":1}]
give @s minecraft:netherite_pickaxe[minecraft:enchantments={"overlimit:hyper_dig":1}]
give @s minecraft:netherite_pickaxe[minecraft:enchantments={"minecraft:efficiency":10}]
give @s minecraft:arrow 64
tellraw @s [{"text":"[overlimit] ","color":"gold"},{"text":"Phase2 テスト装備を付与しました（インパクト／サモン狼／精錬／ハイパーディグ／効率強化は別ツルハシ）","color":"gray"}]
