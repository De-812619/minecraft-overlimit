# デバッグ: 対価なしで発生中イベントを抑止する（実行者不要のワールド処理）
execute if score #bm_active overlimit.const matches 1 run return run function overlimit:suppress/force_bm
execute if score #no_active overlimit.const matches 1 run return run function overlimit:suppress/force_no
execute if score #no_nethering overlimit.const matches 1 run return run function overlimit:suppress/force_no
tellraw @s {"text":"[overlimit] 抑止するイベントがない","color":"red"}
