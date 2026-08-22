execute unless block ~ ~ ~ #minecraft:air unless block ~ ~ ~ #overlimit:nether_tree_space run return fail
execute if score #no_biome overlimit.const matches 1 run return run function overlimit:nether_overflow/netherize_tree_crimson
execute if score #no_biome overlimit.const matches 2 run return run function overlimit:nether_overflow/netherize_tree_warped
return fail
