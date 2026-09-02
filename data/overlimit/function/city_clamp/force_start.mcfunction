execute if score #cc_active overlimit.const matches 1 run return run tellraw @s {"text":"[overlimit] シティクランプはすでに発生中","color":"red"}
execute store result score #cc_diff overlimit.const run difficulty
execute if score #cc_diff overlimit.const matches 0 run return run tellraw @s {"text":"[overlimit] Peacefulでは開始できない","color":"red"}
execute if entity @e[type=minecraft:ender_dragon] run return run tellraw @s {"text":"[overlimit] ドラゴン生存中は開始できない","color":"red"}
execute unless predicate overlimit:in_the_end run return run tellraw @s {"text":"[overlimit] エンドで実行してください","color":"red"}
execute unless predicate overlimit:in_end_city run return run tellraw @s {"text":"[overlimit] 未クリアのエンドシティの中で実行してください","color":"red"}
tag @s remove overlimit.cc_tried
function overlimit:city_clamp/try_enter
execute unless score #cc_active overlimit.const matches 1 run return run tellraw @s {"text":"[overlimit] 開始に失敗した（このシティはクリア済み）","color":"red"}
tellraw @s {"text":"[overlimit] シティクランプを強制開始した","color":"gold"}
