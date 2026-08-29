# 先読み中、チャンクが載り次第リモートで門を建てる。
execute if score #bw_gate overlimit.const matches 1 run return fail
execute unless data storage overlimit:portal origin.x run return fail
scoreboard players set #bw_no_tp overlimit.const 1
function overlimit:portal/try_build_at with storage overlimit:portal origin
scoreboard players set #bw_no_tp overlimit.const 0
