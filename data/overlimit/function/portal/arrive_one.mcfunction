# 帰りの to_ow は、次元が切り替わるまで待ってから OW 到着処理する。
execute if entity @s[tag=overlimit.to_ow] if predicate overlimit:in_overworld run return run function overlimit:portal/arrive_one_ow
execute if entity @s[tag=overlimit.to_ow] run return fail
execute if entity @s[tag=overlimit.to_bw] if predicate overlimit:in_overworld run return run function overlimit:portal/retry_to_bw
function overlimit:portal/arrive_one_bw
