advancement revoke @s only overlimit:blood_moon/on_kill
execute if score #bm_active overlimit.const matches 1 if predicate overlimit:in_overworld run function overlimit:blood_moon/credit_pending
execute if score #bw_active overlimit.const matches 1 if predicate overlimit:in_blood_world run function overlimit:blood_world/credit_pending
