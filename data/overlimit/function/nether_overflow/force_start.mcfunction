execute if score #no_active overlimit.const matches 1 run return run tellraw @s {"text":"[overlimit] ネザーオーバーフローはすでに発生中","color":"red"}
execute if score #no_nethering overlimit.const matches 1 run return run tellraw @s {"text":"[overlimit] ネザー化の途中です。終わるまで待ってください","color":"red"}
execute if score #bm_active overlimit.const matches 1 run return run tellraw @s {"text":"[overlimit] ブラッドムーン中は開始できない","color":"red"}
execute store result score #no_diff overlimit.const run difficulty
execute if score #no_diff overlimit.const matches 0 run return run tellraw @s {"text":"[overlimit] Peacefulでは開始できない","color":"red"}
execute unless predicate overlimit:in_overworld run return run tellraw @s {"text":"[overlimit] オーバーワールドで実行してください","color":"red"}
execute at @s run function overlimit:nether_overflow/scan_near
execute as @e[type=minecraft:marker,tag=overlimit.no_gate] at @s run function overlimit:nether_overflow/remember_gate
execute unless data storage overlimit:no gates[0] run return run tellraw @s {"text":"[overlimit] 登録されたネザーポータルがありません。一度ポータルに近づいてください","color":"red"}
function overlimit:nether_overflow/start
execute unless score #no_active overlimit.const matches 1 run return run tellraw @s {"text":"[overlimit] 開始に失敗した（登録門またはOWプレイヤーを確認）","color":"red"}
tellraw @s {"text":"[overlimit] ネザーオーバーフローを強制開始した","color":"gold"}
