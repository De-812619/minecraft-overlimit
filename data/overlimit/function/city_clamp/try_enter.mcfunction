execute if score #cc_active overlimit.const matches 1 run return fail
execute store result score #cc_diff overlimit.const run difficulty
execute if score #cc_diff overlimit.const matches 0 run return fail
execute if entity @e[type=minecraft:ender_dragon] run return fail
tag @s add overlimit.cc_tried
execute unless predicate overlimit:in_end_city run return fail
scoreboard players set #cc_kind_id overlimit.const 3
data modify storage overlimit:cc target.kind set value "minecraft:end_city"
execute unless function overlimit:city_clamp/resolve_here run return fail
tag @a remove overlimit.cc_pick
tag @s add overlimit.cc_pick
function overlimit:city_clamp/start
return 1
