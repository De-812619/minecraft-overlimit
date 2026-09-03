# テスト用: 指定鉱石の装飾ネザライト4部位を装備スロットへ直入れ（着忘れ防止）
$item replace entity @s armor.head with minecraft:netherite_helmet[minecraft:trim={pattern:"minecraft:sentry",material:"minecraft:$(mat)"}]
$item replace entity @s armor.chest with minecraft:netherite_chestplate[minecraft:trim={pattern:"minecraft:sentry",material:"minecraft:$(mat)"}]
$item replace entity @s armor.legs with minecraft:netherite_leggings[minecraft:trim={pattern:"minecraft:sentry",material:"minecraft:$(mat)"}]
$item replace entity @s armor.feet with minecraft:netherite_boots[minecraft:trim={pattern:"minecraft:sentry",material:"minecraft:$(mat)"}]
function overlimit:trim/scan
$tellraw @s [{"text":"[overlimit] ","color":"gold"},{"text":"装飾テスト装備を装備: $(mat)（4部位・3でセット）","color":"gray"}]
