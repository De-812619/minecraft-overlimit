# 海など陸地なし。全員を同じ次の候補へ。
execute if score #bw_gate overlimit.const matches 1 run return run function overlimit:portal/to_bw_gate
return run function overlimit:portal/search_next
