# 門が立ったので、広域 forceload を門の周囲だけに縮小する。
execute if data storage overlimit:portal origin.x run function overlimit:portal/unload_pend with storage overlimit:portal origin
execute if data storage overlimit:portal pend.x run function overlimit:portal/unload_pend with storage overlimit:portal pend
execute store result storage overlimit:portal fl.x int 1 run scoreboard players get #bw_sess_x overlimit.const
execute store result storage overlimit:portal fl.z int 1 run scoreboard players get #bw_sess_z overlimit.const
function overlimit:portal/forceload_gate with storage overlimit:portal fl
