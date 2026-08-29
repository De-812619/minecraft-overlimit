$data modify storage overlimit:portal chk set from storage overlimit:portal used[$(i)]
execute store result score #bw_ex overlimit.const run data get storage overlimit:portal chk.x
execute store result score #bw_ez overlimit.const run data get storage overlimit:portal chk.z
scoreboard players operation #bw_ex overlimit.const -= #bw_qx overlimit.const
scoreboard players operation #bw_ez overlimit.const -= #bw_qz overlimit.const
execute if score #bw_ex overlimit.const matches 100.. run return 0
execute if score #bw_ex overlimit.const matches ..-100 run return 0
execute if score #bw_ez overlimit.const matches 100.. run return 0
execute if score #bw_ez overlimit.const matches ..-100 run return 0
scoreboard players set #bw_hit overlimit.const 1
return 1
