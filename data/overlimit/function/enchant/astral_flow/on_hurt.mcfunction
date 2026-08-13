advancement revoke @s only overlimit:enchant/astral_hurt
execute unless score @s overlimit.astral.on matches 1.. run return fail
function overlimit:enchant/astral_flow/do_drain
