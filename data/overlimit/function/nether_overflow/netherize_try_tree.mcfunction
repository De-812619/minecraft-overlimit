execute if block ~ ~ ~ #overlimit:nether_tree_base positioned ~ ~1 ~ run return run function overlimit:nether_overflow/netherize_plant_tree
execute if block ~ ~-1 ~ #overlimit:nether_tree_base run return run function overlimit:nether_overflow/netherize_plant_tree
return fail
