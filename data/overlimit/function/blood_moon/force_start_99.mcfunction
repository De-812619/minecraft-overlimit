# テスト用。夜にしてイベントを強制開始し、撃破点を 99 にする。
execute if score #bm_active overlimit.const matches 1 run return run tellraw @s {"text":"[overlimit] ブラッドムーンはすでに発生中","color":"red"}
execute store result score #bm_diff overlimit.const run difficulty
execute if score #bm_diff overlimit.const matches 0 run tellraw @s {"text":"[overlimit] Peacefulでは敵が出ません。Easy以上にしてください","color":"red"}
execute in minecraft:overworld run time set 13000
function overlimit:blood_moon/start
scoreboard players set #bm_kills overlimit.const 99
function overlimit:blood_moon/bossbar_name
tellraw @s {"text":"[overlimit] ブラッドムーンを強制開始した（撃破点 99/100、時刻を夜に変更）","color":"gold"}
