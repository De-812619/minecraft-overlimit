execute unless loaded ~ ~ ~ run return fail
function overlimit:nether_overflow/netherize_biome
function overlimit:nether_overflow/netherize_pick
execute store result score #no_shape overlimit.const run random value 0..99
execute if score #no_shape overlimit.const matches 0..44 run function overlimit:nether_overflow/netherize_fill_1 with storage overlimit:no neth
execute if score #no_shape overlimit.const matches 45..74 run function overlimit:nether_overflow/netherize_fill_2 with storage overlimit:no neth
execute if score #no_shape overlimit.const matches 75..99 run function overlimit:nether_overflow/netherize_fill_3 with storage overlimit:no neth
execute store result score #no_tree overlimit.const run random value 0..99
execute if score #no_biome overlimit.const matches 1 if score #no_tree overlimit.const matches ..4 run function overlimit:nether_overflow/netherize_try_tree
execute if score #no_biome overlimit.const matches 2 if score #no_tree overlimit.const matches ..4 run function overlimit:nether_overflow/netherize_try_tree
execute if score #no_biome overlimit.const matches 1 if score #no_tree overlimit.const matches 5..22 run function overlimit:nether_overflow/netherize_try_veg
execute if score #no_biome overlimit.const matches 2 if score #no_tree overlimit.const matches 5..22 run function overlimit:nether_overflow/netherize_try_veg
