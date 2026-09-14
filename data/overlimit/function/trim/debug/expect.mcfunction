execute if score @s overlimit.trim.iron matches 1.. run tellraw @s [{"text":"  期待 鉄部位: 防御 +0.5×","color":"aqua"},{"score":{"name":"@s","objective":"overlimit.trim.iron"}}]
execute if entity @s[tag=overlimit.trim.set.iron] run tellraw @s {"text":"  期待 鉄セット: KB+0.1 / 消耗半減","color":"aqua"}
execute if score @s overlimit.trim.gold matches 1.. run tellraw @s [{"text":"  期待 金部位: 移動 +1%×","color":"aqua"},{"score":{"name":"@s","objective":"overlimit.trim.gold"}}]
execute if entity @s[tag=overlimit.trim.set.gold] run tellraw @s {"text":"  期待 金セット: 頭id=golden_helmet / ピグリン中立","color":"aqua"}
execute if score @s overlimit.trim.diamond matches 1.. run tellraw @s [{"text":"  期待 ダイヤ部位: 攻撃 +0.5×","color":"aqua"},{"score":{"name":"@s","objective":"overlimit.trim.diamond"}}]
execute if entity @s[tag=overlimit.trim.set.diamond] run tellraw @s {"text":"  期待 ダイヤセット: 満タン時 攻撃+10% 防御+2","color":"aqua"}
execute if score @s overlimit.trim.netherite matches 1.. run tellraw @s [{"text":"  期待 ネザライト部位: HP +1×","color":"aqua"},{"score":{"name":"@s","objective":"overlimit.trim.netherite"}}]
execute if entity @s[tag=overlimit.trim.set.netherite] run tellraw @s {"text":"  期待 ネザライトセット: 炎上時間 -80%","color":"aqua"}
execute if score @s overlimit.trim.copper matches 1.. run tellraw @s [{"text":"  期待 銅部位: 攻速 +2%×","color":"aqua"},{"score":{"name":"@s","objective":"overlimit.trim.copper"}}]
execute if entity @s[tag=overlimit.trim.set.copper] run tellraw @s {"text":"  期待 銅セット: 8ヒットの次が放電（雷雨は毎撃）","color":"aqua"}
execute if score @s overlimit.trim.redstone matches 1.. run tellraw @s [{"text":"  期待 赤石部位: スニーク +5%×","color":"aqua"},{"score":{"name":"@s","objective":"overlimit.trim.redstone"}}]
execute if entity @s[tag=overlimit.trim.set.redstone] run tellraw @s {"text":"  期待 赤石セット: ブロックリーチ +3","color":"aqua"}
execute if score @s overlimit.trim.lapis matches 1.. run tellraw @s [{"text":"  期待 ラピス部位: 幸運 +0.25×","color":"aqua"},{"score":{"name":"@s","objective":"overlimit.trim.lapis"}}]
execute if entity @s[tag=overlimit.trim.set.lapis] run tellraw @s {"text":"  期待 ラピスセット: 攻撃・防御 +0.05×Lv（最大30）","color":"aqua"}
execute if score @s overlimit.trim.emerald matches 1.. run tellraw @s {"text":"  期待 エメラルド部位: イレイジャー被ダメ減は未実装","color":"dark_aqua"}
execute if entity @s[tag=overlimit.trim.set.emerald] run tellraw @s {"text":"  期待 エメラルドセット: 半径8のイレイジャー攻撃 -20%","color":"aqua"}
execute if score @s overlimit.trim.amethyst matches 1.. run tellraw @s [{"text":"  期待 アメジスト部位: 落下ダメ -8%×","color":"aqua"},{"score":{"name":"@s","objective":"overlimit.trim.amethyst"}}]
execute if entity @s[tag=overlimit.trim.set.amethyst] run tellraw @s {"text":"  期待 アメジストセット: 暗闇無効 / 暗所暗視 / 着地KB","color":"aqua"}
execute if score @s overlimit.trim.quartz matches 1.. run tellraw @s [{"text":"  期待 クォーツ部位: 攻速 +2%×","color":"aqua"},{"score":{"name":"@s","objective":"overlimit.trim.quartz"}}]
execute if entity @s[tag=overlimit.trim.set.quartz] run tellraw @s {"text":"  期待 クォーツセット: 空中クリ時に攻撃の15%追加","color":"aqua"}
execute if score @s overlimit.trim.resin matches 1.. run tellraw @s [{"text":"  期待 樹脂部位: 静止時のみ防御 +0.5×","color":"aqua"},{"score":{"name":"@s","objective":"overlimit.trim.resin"}}]
execute if entity @s[tag=overlimit.trim.set.resin] run tellraw @s {"text":"  期待 樹脂セット: 被弾鈍足II / 視線で移動停止","color":"aqua"}
