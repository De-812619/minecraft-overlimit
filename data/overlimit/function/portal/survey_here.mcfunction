# 陸地系構造物を1回の locate で拾い、4点測量で座標を出す。
scoreboard players set #bw_best overlimit.const 2147483647
scoreboard players set #bw_found overlimit.const 0
data modify storage overlimit:portal survey.kind set value "#overlimit:bw_land_landmark"
function overlimit:portal/survey_consider with storage overlimit:portal survey
execute if score #bw_found overlimit.const matches 0 run return fail
data modify storage overlimit:portal survey.kind set from storage overlimit:portal survey.win
return run function overlimit:portal/survey_measure with storage overlimit:portal survey
