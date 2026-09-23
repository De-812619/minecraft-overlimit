# 見た目確認用。ステータスはネザライトのまま。
loot give @s loot overlimit:unlimited_royal_helmet
loot give @s loot overlimit:unlimited_royal_chestplate
loot give @s loot overlimit:unlimited_royal_leggings
loot give @s loot overlimit:unlimited_royal_boots
tellraw @s [{"translate": "overlimit.cmd.prefix","color":"gold"},{"translate": "overlimit.cmd.gave_ul_royal","color":"gray"}]
