tag @a remove overlimit.nr_pick
scoreboard players operation #nr_best overlimit.const = #nr_try overlimit.const
tag @s add overlimit.nr_pick
scoreboard players set #nr_kind_id overlimit.const 2
data modify storage overlimit:nr target.kind set value "minecraft:bastion_remnant"
