advancement revoke @s only overlimit:attrition/on_hurt
execute unless score #bm_active overlimit.const matches 1 unless score #no_active overlimit.const matches 1 run return fail
execute if score #no_nethering overlimit.const matches 1 run return fail
execute unless predicate overlimit:in_overworld run return fail
function overlimit:attrition/apply
