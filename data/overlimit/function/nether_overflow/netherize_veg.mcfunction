execute unless block ~ ~ ~ #minecraft:air unless block ~ ~ ~ #overlimit:nether_tree_space run return fail
execute unless block ~ ~-1 ~ minecraft:crimson_nylium unless block ~ ~-1 ~ minecraft:warped_nylium run return fail
execute store result score #no_veg overlimit.const run random value 0..99
execute if score #no_biome overlimit.const matches 1 if score #no_veg overlimit.const matches 0..44 run setblock ~ ~ ~ minecraft:crimson_fungus
execute if score #no_biome overlimit.const matches 1 if score #no_veg overlimit.const matches 45..84 run setblock ~ ~ ~ minecraft:crimson_roots
execute if score #no_biome overlimit.const matches 1 if score #no_veg overlimit.const matches 85..99 run setblock ~ ~ ~ minecraft:nether_sprouts
execute if score #no_biome overlimit.const matches 2 if score #no_veg overlimit.const matches 0..44 run setblock ~ ~ ~ minecraft:warped_fungus
execute if score #no_biome overlimit.const matches 2 if score #no_veg overlimit.const matches 45..84 run setblock ~ ~ ~ minecraft:warped_roots
execute if score #no_biome overlimit.const matches 2 if score #no_veg overlimit.const matches 85..99 run setblock ~ ~ ~ minecraft:nether_sprouts
return 1
