scoreboard players set #nr_kind_id overlimit.const 2
data modify storage overlimit:nr target.kind set value "minecraft:bastion_remnant"
execute unless function overlimit:nether_raise/resolve_here run return fail
tag @a remove overlimit.nr_pick
tag @s add overlimit.nr_pick
function overlimit:nether_raise/start
return 1
