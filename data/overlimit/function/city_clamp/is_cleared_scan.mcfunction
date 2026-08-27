$data modify storage overlimit:cc chk set from storage overlimit:cc cleared[$(i)]
execute store result score #cc_ck overlimit.const run data get storage overlimit:cc chk.kind_id
execute unless score #cc_ck overlimit.const = #cc_qk overlimit.const run return 0
execute store result score #cc_ex overlimit.const run data get storage overlimit:cc chk.x
execute store result score #cc_ez overlimit.const run data get storage overlimit:cc chk.z
scoreboard players operation #cc_ex overlimit.const -= #cc_qx overlimit.const
scoreboard players operation #cc_ez overlimit.const -= #cc_qz overlimit.const
execute if score #cc_ex overlimit.const matches 48.. run return 0
execute if score #cc_ex overlimit.const matches ..-48 run return 0
execute if score #cc_ez overlimit.const matches 48.. run return 0
execute if score #cc_ez overlimit.const matches ..-48 run return 0
scoreboard players set #cc_hit overlimit.const 1
return 1
