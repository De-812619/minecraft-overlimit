execute if score #nr_active overlimit.const matches 1 run return run tellraw @s {"text":"[overlimit] ネザーレイズはすでに発生中","color":"red"}
execute store result score #nr_diff overlimit.const run difficulty
execute if score #nr_diff overlimit.const matches 0 run return run tellraw @s {"text":"[overlimit] Peacefulでは開始できない","color":"red"}
execute unless predicate overlimit:in_nether run return run tellraw @s {"text":"[overlimit] ネザーで実行してください","color":"red"}
scoreboard players set #nr_dwell overlimit.const 36000
function overlimit:nether_raise/try_start
execute unless score #nr_active overlimit.const matches 1 run return run tellraw @s {"text":"[overlimit] 開始に失敗した（1200以内の未クリア構造物を確認）","color":"red"}
tellraw @s {"text":"[overlimit] ネザーレイズを強制開始した","color":"gold"}
