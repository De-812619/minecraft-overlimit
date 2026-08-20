# 12回外したら spreadplayers で陸地を拾う。
execute if data storage overlimit:portal pend.x run function overlimit:portal/unload_pend with storage overlimit:portal pend
scoreboard players operation #ox overlimit.const = #bw_spawn_x overlimit.const
scoreboard players operation #oz overlimit.const = #bw_spawn_z overlimit.const
execute if score #bw_origin_from_gate overlimit.const matches 1 run scoreboard players operation #ox overlimit.const = #bw_origin_x overlimit.const
execute if score #bw_origin_from_gate overlimit.const matches 1 run scoreboard players operation #oz overlimit.const = #bw_origin_z overlimit.const
execute store result storage overlimit:portal spread.x int 1 run scoreboard players get #ox overlimit.const
execute store result storage overlimit:portal spread.z int 1 run scoreboard players get #oz overlimit.const
function overlimit:portal/last_spread_run with storage overlimit:portal spread
