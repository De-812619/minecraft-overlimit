execute if entity @s[tag=overlimit.to_bw] if predicate overlimit:in_overworld run return run function overlimit:portal/retry_spread
execute if predicate overlimit:in_overworld run return run function overlimit:portal/arrive_one_ow
function overlimit:portal/arrive_one_bw
