# 見た目確認用。ステータスはネザライトのまま。
loot give @s loot overlimit:unlimited_demon_helmet
loot give @s loot overlimit:unlimited_demon_chestplate
loot give @s loot overlimit:unlimited_demon_leggings
loot give @s loot overlimit:unlimited_demon_boots
tellraw @s [{"translate": "overlimit.cmd.prefix","color":"gold"},{"translate": "overlimit.cmd.gave_ul_demon","color":"gray"}]
