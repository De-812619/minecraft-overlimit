# デバッグ: イベント中でなくても1回分の消耗を自分に適用
function overlimit:attrition/apply
tellraw @s {"translate": "overlimit.cmd.attrition_hit","color":"gold"}
