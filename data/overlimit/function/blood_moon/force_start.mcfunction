# テスト用。夜にしてイベントを強制開始する。
execute if score #bm_active overlimit.const matches 1 run return run tellraw @s {"text":"[overlimit] ブラッドムーンはすでに発生中","color":"red"}
execute store result score #bm_diff overlimit.const run difficulty
execute if score #bm_diff overlimit.const matches 0 run tellraw @s {"text":"[overlimit] Peacefulでは敵が出ません。Easy以上にしてください","color":"red"}
execute in minecraft:overworld run time set 13000
function overlimit:blood_moon/start
tellraw @s {"text":"[overlimit] ブラッドムーンを強制開始した（時刻を夜に変更）","color":"gold"}
