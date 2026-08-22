execute store result score #no_blk overlimit.const run random value 0..99
execute if score #no_biome overlimit.const matches 0 run function overlimit:nether_overflow/netherize_pick_wastes
execute if score #no_biome overlimit.const matches 1 run function overlimit:nether_overflow/netherize_pick_crimson
execute if score #no_biome overlimit.const matches 2 run function overlimit:nether_overflow/netherize_pick_warped
execute if score #no_biome overlimit.const matches 3 run function overlimit:nether_overflow/netherize_pick_blackstone
execute if score #no_biome overlimit.const matches 4 run function overlimit:nether_overflow/netherize_pick_basalt
