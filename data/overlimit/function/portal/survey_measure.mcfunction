$execute positioned ~64 ~ ~ store result score #bw_dxp overlimit.const run locate structure $(kind)
$execute positioned ~-64 ~ ~ store result score #bw_dxm overlimit.const run locate structure $(kind)
$execute positioned ~ ~ ~64 store result score #bw_dzp overlimit.const run locate structure $(kind)
$execute positioned ~ ~ ~-64 store result score #bw_dzm overlimit.const run locate structure $(kind)
scoreboard players set #bw_sdiv overlimit.const 256
execute unless function overlimit:portal/survey_solve run return fail
scoreboard players operation #bw_qx overlimit.const = #ox overlimit.const
scoreboard players operation #bw_qx overlimit.const += #bw_sox overlimit.const
scoreboard players operation #bw_qz overlimit.const = #oz overlimit.const
scoreboard players operation #bw_qz overlimit.const += #bw_soz overlimit.const
execute store result storage overlimit:portal probe.x int 1 run scoreboard players get #bw_qx overlimit.const
execute store result storage overlimit:portal probe.z int 1 run scoreboard players get #bw_qz overlimit.const
data modify storage overlimit:portal probe.kind set from storage overlimit:portal survey.kind
function overlimit:portal/survey_probe with storage overlimit:portal probe
scoreboard players set #bw_sdiv overlimit.const 64
execute unless function overlimit:portal/survey_solve run return fail
scoreboard players operation #bw_qx overlimit.const += #bw_sox overlimit.const
scoreboard players operation #bw_qz overlimit.const += #bw_soz overlimit.const
scoreboard players operation #ox overlimit.const = #bw_qx overlimit.const
scoreboard players operation #oz overlimit.const = #bw_qz overlimit.const
scoreboard players operation #bw_search_cx overlimit.const = #bw_qx overlimit.const
scoreboard players operation #bw_search_cz overlimit.const = #bw_qz overlimit.const
execute store result storage overlimit:portal origin.x int 1 run scoreboard players get #bw_qx overlimit.const
execute store result storage overlimit:portal origin.z int 1 run scoreboard players get #bw_qz overlimit.const
execute store result storage overlimit:portal pend.x int 1 run scoreboard players get #bw_qx overlimit.const
execute store result storage overlimit:portal pend.z int 1 run scoreboard players get #bw_qz overlimit.const
data modify storage overlimit:portal pend.y set value 220
data modify storage overlimit:portal pend.dim set value "overlimit:blood_world"
scoreboard players set #bw_survey_ok overlimit.const 1
return 1
