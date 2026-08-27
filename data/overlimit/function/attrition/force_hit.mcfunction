# デバッグ: イベント中でなくても1回分の消耗を自分に適用
function overlimit:attrition/apply
tellraw @s {"text":"[overlimit] 消耗を1回分適用した","color":"gold"}
