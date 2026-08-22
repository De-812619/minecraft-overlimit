execute store result score #no_skip overlimit.const run random value 0..99
execute if score #no_skip overlimit.const matches ..7 run return fail
execute store result storage overlimit:no col.x int 1 run scoreboard players get #no_nx overlimit.const
execute store result storage overlimit:no col.z int 1 run scoreboard players get #no_nz overlimit.const
function overlimit:nether_overflow/netherize_column_at with storage overlimit:no col
