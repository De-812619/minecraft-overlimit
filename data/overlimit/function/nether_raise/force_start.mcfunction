execute if score #nr_active overlimit.const matches 1 run return run tellraw @s {"text":"[overlimit] ネザーレイズはすでに発生中","color":"red"}
execute store result score #nr_diff overlimit.const run difficulty
execute if score #nr_diff overlimit.const matches 0 run return run tellraw @s {"text":"[overlimit] Peacefulでは開始できない","color":"red"}
execute unless predicate overlimit:in_nether run return run tellraw @s {"text":"[overlimit] ネザーで実行してください","color":"red"}
execute unless predicate overlimit:in_fortress unless predicate overlimit:in_bastion run return run tellraw @s {"text":"[overlimit] 未クリアの要塞かバストリオンの中で実行してください","color":"red"}
tag @s remove overlimit.nr_tried
function overlimit:nether_raise/try_enter
execute unless score #nr_active overlimit.const matches 1 run return run tellraw @s {"text":"[overlimit] 開始に失敗した（この構造物はクリア済み）","color":"red"}
tellraw @s {"text":"[overlimit] ネザーレイズを強制開始した","color":"gold"}
