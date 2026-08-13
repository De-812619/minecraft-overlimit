# Fallback when HurtTime:10s selector missed — only if still hurt.
execute store result score #ht overlimit.const run data get entity @s HurtTime
execute unless score #ht overlimit.const matches 1.. run return fail
function overlimit:enchant/necromancy/process_victim
