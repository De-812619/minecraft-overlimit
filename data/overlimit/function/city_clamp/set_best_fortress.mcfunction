tag @a remove overlimit.cc_pick
scoreboard players operation #cc_best overlimit.const = #cc_try overlimit.const
tag @s add overlimit.cc_pick
scoreboard players set #cc_kind_id overlimit.const 1
data modify storage overlimit:cc target.kind set value "minecraft:end_city"
