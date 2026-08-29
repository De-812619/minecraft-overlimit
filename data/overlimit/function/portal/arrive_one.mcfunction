# 帰りの to_ow は、次元が切り替わるまで待ってから OW 到着処理する。
# 同じtickに BW 側の合流（門の手前へTP）へ落とすと、帰った直後にBW門へ戻される。
execute if entity @s[tag=overlimit.to_ow] if predicate overlimit:in_overworld run return run function overlimit:portal/arrive_one_ow
execute if entity @s[tag=overlimit.to_ow] run return fail
execute if entity @s[tag=overlimit.to_bw] if predicate overlimit:in_overworld unless entity @e[type=minecraft:marker,tag=overlimit.bw_portal,distance=..32] run return run function overlimit:portal/abort_away
execute if entity @s[tag=overlimit.to_bw] if predicate overlimit:in_overworld if score #bw_gate overlimit.const matches 1 run return run function overlimit:portal/retry_bw_gate
execute if entity @s[tag=overlimit.to_bw] if predicate overlimit:in_overworld run return run function overlimit:portal/try_place_from_ow
execute if predicate overlimit:in_overworld run return run function overlimit:portal/arrive_one_ow
function overlimit:portal/arrive_one_bw
