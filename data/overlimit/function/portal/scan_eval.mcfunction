execute store result score #bw_offx overlimit.const run data get storage overlimit:portal scan.ox
execute store result score #bw_offz overlimit.const run data get storage overlimit:portal scan.oz
scoreboard players set #bw_sdiv overlimit.const 256
execute unless function overlimit:portal/survey_solve run return fail
scoreboard players operation #bw_qx overlimit.const = #bw_px overlimit.const
scoreboard players operation #bw_qx overlimit.const += #bw_offx overlimit.const
scoreboard players operation #bw_qx overlimit.const += #bw_sox overlimit.const
scoreboard players operation #bw_qz overlimit.const = #bw_pz overlimit.const
scoreboard players operation #bw_qz overlimit.const += #bw_offz overlimit.const
scoreboard players operation #bw_qz overlimit.const += #bw_soz overlimit.const
execute store result storage overlimit:portal probe.x int 1 run scoreboard players get #bw_qx overlimit.const
execute store result storage overlimit:portal probe.z int 1 run scoreboard players get #bw_qz overlimit.const
data modify storage overlimit:portal probe.kind set from storage overlimit:portal scan_kind
function overlimit:portal/survey_probe with storage overlimit:portal probe
scoreboard players set #bw_sdiv overlimit.const 64
execute unless function overlimit:portal/survey_solve run return fail
scoreboard players operation #bw_qx overlimit.const += #bw_sox overlimit.const
scoreboard players operation #bw_qz overlimit.const += #bw_soz overlimit.const
execute if function overlimit:portal/is_used run return fail
scoreboard players operation #bw_sdx overlimit.const = #bw_qx overlimit.const
scoreboard players operation #bw_sdx overlimit.const -= #bw_px overlimit.const
scoreboard players operation #bw_sdz overlimit.const = #bw_qz overlimit.const
scoreboard players operation #bw_sdz overlimit.const -= #bw_pz overlimit.const
execute if score #bw_sdx overlimit.const matches ..-1 run scoreboard players operation #bw_sdx overlimit.const *= #-1 overlimit.const
execute if score #bw_sdz overlimit.const matches ..-1 run scoreboard players operation #bw_sdz overlimit.const *= #-1 overlimit.const
scoreboard players operation #bw_smax overlimit.const = #bw_sdx overlimit.const
scoreboard players operation #bw_smin overlimit.const = #bw_sdz overlimit.const
execute if score #bw_sdz overlimit.const > #bw_sdx overlimit.const run scoreboard players operation #bw_smax overlimit.const = #bw_sdz overlimit.const
execute if score #bw_sdz overlimit.const > #bw_sdx overlimit.const run scoreboard players operation #bw_smin overlimit.const = #bw_sdx overlimit.const
scoreboard players operation #bw_smin overlimit.const *= #3 overlimit.const
scoreboard players operation #bw_smin overlimit.const /= #8 overlimit.const
scoreboard players operation #bw_sd overlimit.const = #bw_smax overlimit.const
scoreboard players operation #bw_sd overlimit.const += #bw_smin overlimit.const
execute if score #bw_sd overlimit.const > #bw_search overlimit.const run return fail
execute unless score #bw_sd overlimit.const < #bw_bestd overlimit.const run return fail
scoreboard players operation #bw_bestd overlimit.const = #bw_sd overlimit.const
scoreboard players operation #bw_wx overlimit.const = #bw_qx overlimit.const
scoreboard players operation #bw_wz overlimit.const = #bw_qz overlimit.const
scoreboard players set #bw_found overlimit.const 1
