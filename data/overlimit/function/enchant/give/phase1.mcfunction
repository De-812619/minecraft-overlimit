# テスト用: Phase1 エンチャント付き装備一式（26.2: enchantments は flat map）
# アストラルフローは保留のため付与しない
give @s minecraft:netherite_sword[minecraft:enchantments={"overlimit:void_break":1,"overlimit:apocalypse":1,"overlimit:soul_taker":1}]
give @s minecraft:netherite_axe[minecraft:enchantments={"overlimit:void_break":1,"overlimit:apocalypse":1,"overlimit:gluttony":1}]
give @s minecraft:netherite_spear[minecraft:enchantments={"overlimit:void_break":1,"overlimit:apocalypse":1,"overlimit:soul_taker":1}]
give @s minecraft:bow[minecraft:enchantments={"overlimit:chain_bind":1}]
give @s minecraft:crossbow[minecraft:enchantments={"overlimit:chain_bind":1}]
give @s minecraft:netherite_chestplate[minecraft:enchantments={"overlimit:absolute_field":1}]
give @s minecraft:netherite_helmet[minecraft:enchantments={"overlimit:clairvoyance":1}]
tellraw @s [{"translate": "overlimit.cmd.prefix","color":"gold"},{"translate": "overlimit.cmd.gave_phase1","color":"gray"}]
