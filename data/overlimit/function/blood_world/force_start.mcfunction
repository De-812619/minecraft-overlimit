# テスト用。ブラッドワールドの時刻を夜にしてイベントを強制開始する。
execute if score #bw_active overlimit.const matches 1 run return run tellraw @s {"text":"[overlimit] ブラッドワールドのブラッドムーンはすでに発生中","color":"red"}
execute store result score #bm_diff overlimit.const run difficulty
execute if score #bm_diff overlimit.const matches 0 run tellraw @s {"text":"[overlimit] Peacefulでは敵が出ません。Easy以上にしてください","color":"red"}
scoreboard players set #bw_ended_day overlimit.const -1
execute in overlimit:blood_world run time set 13000
function overlimit:blood_world/start
tellraw @s {"text":"[overlimit] ブラッドワールドのブラッドムーンを強制開始した（時刻を夜に変更）","color":"gold"}
