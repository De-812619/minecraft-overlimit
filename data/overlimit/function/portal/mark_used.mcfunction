# いまの構造物を次の候補から外す。既に入っていれば何もしない。
execute store result score #bw_qx overlimit.const run data get storage overlimit:portal landmark.x
execute store result score #bw_qz overlimit.const run data get storage overlimit:portal landmark.z
execute unless data storage overlimit:portal landmark.x store result score #bw_qx overlimit.const run data get storage overlimit:portal origin.x
execute unless data storage overlimit:portal landmark.x store result score #bw_qz overlimit.const run data get storage overlimit:portal origin.z
execute if function overlimit:portal/is_used run return fail
data modify storage overlimit:portal used append value {x:0,z:0}
execute store result storage overlimit:portal used[-1].x int 1 run scoreboard players get #bw_qx overlimit.const
execute store result storage overlimit:portal used[-1].z int 1 run scoreboard players get #bw_qz overlimit.const
return 1
