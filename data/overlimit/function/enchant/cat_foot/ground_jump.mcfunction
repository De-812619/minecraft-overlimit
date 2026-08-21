execute if score @s overlimit.cat_boost matches 1 run return fail
function overlimit:enchant/cat_foot/strip_old_jump
attribute @s minecraft:jump_strength modifier add overlimit:cat_foot_jump 0.2 add_value
scoreboard players set @s overlimit.cat_boost 1
