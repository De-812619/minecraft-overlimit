advancement revoke @s only overlimit:blood_moon/on_kill
execute unless score #bm_active overlimit.const matches 1 run return fail
function overlimit:blood_moon/credit_pending
