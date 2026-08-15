advancement revoke @s only overlimit:blood_moon/on_kill
execute unless score #bm_active overlimit.const matches 1 run return fail
execute unless predicate overlimit:in_overworld run return fail

scoreboard players add #bm_kills overlimit.const 1
scoreboard players reset #bm_kills_shown overlimit.const
function overlimit:blood_moon/bossbar_name
execute if score #bm_kills overlimit.const matches 100.. run function overlimit:blood_moon/end_victory
