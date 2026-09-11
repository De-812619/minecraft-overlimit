advancement revoke @s only overlimit:item/bm_totem
execute unless predicate overlimit:in_overworld unless predicate overlimit:in_blood_world run return run function overlimit:item/bm_totem/on_fail_dim
execute if predicate overlimit:in_overworld if score #bm_active overlimit.const matches 1 run return run function overlimit:item/bm_totem/on_fail_active
execute if predicate overlimit:in_overworld if score #no_active overlimit.const matches 1 run return run function overlimit:item/bm_totem/on_fail_overflow
execute if predicate overlimit:in_blood_world if score #bw_active overlimit.const matches 1 run return run function overlimit:item/bm_totem/on_fail_active
tellraw @a [{"selector":"@s","color":"dark_red"},{"text":" が凶兆のトーテムでブラッドムーンを呼び出した。","color":"gray"}]
execute if predicate overlimit:in_overworld run function overlimit:item/bm_totem/start_ow
execute if predicate overlimit:in_blood_world run function overlimit:item/bm_totem/start_bw
tag @s add overlimit.bt_pay
schedule function overlimit:item/bm_totem/pay_pulse 1t append
