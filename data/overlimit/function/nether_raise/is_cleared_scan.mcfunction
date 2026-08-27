$data modify storage overlimit:nr chk set from storage overlimit:nr cleared[$(i)]
execute store result score #nr_ck overlimit.const run data get storage overlimit:nr chk.kind_id
execute unless score #nr_ck overlimit.const = #nr_qk overlimit.const run return 0
execute store result score #nr_ex overlimit.const run data get storage overlimit:nr chk.x
execute store result score #nr_ez overlimit.const run data get storage overlimit:nr chk.z
scoreboard players operation #nr_ex overlimit.const -= #nr_qx overlimit.const
scoreboard players operation #nr_ez overlimit.const -= #nr_qz overlimit.const
execute if score #nr_ex overlimit.const matches 48.. run return 0
execute if score #nr_ex overlimit.const matches ..-48 run return 0
execute if score #nr_ez overlimit.const matches 48.. run return 0
execute if score #nr_ez overlimit.const matches ..-48 run return 0
scoreboard players set #nr_hit overlimit.const 1
return 1
