# テスト用。夜にしてイベントを強制開始し、撃破点を 99 にする。
execute if score #bw_active overlimit.const matches 1 run return run tellraw @s {"text":"[overlimit] ブラッドワールドのブラッドムーンはすでに発生中","color":"red"}
execute store result score #bm_diff overlimit.const run difficulty
execute if score #bm_diff overlimit.const matches 0 run tellraw @s {"text":"[overlimit] Peacefulでは敵が出ません。Easy以上にしてください","color":"red"}
scoreboard players set #bw_ended_day overlimit.const -1
execute in overlimit:blood_world run time set 13000
function overlimit:blood_world/clock_resume
function overlimit:blood_world/start
scoreboard players set #bw_kills overlimit.const 99
function overlimit:blood_world/bossbar_name
tellraw @s {"text":"[overlimit] ブラッドワールドのブラッドムーンを強制開始した（撃破点 99/100、時刻を夜に変更）","color":"gold"}
