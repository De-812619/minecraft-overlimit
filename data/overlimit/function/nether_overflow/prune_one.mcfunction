execute if function overlimit:nether_overflow/is_bw_gate run return run function overlimit:nether_overflow/drop_gate
execute if block ~ ~ ~ minecraft:nether_portal run return fail
execute if block ~1 ~ ~ minecraft:nether_portal run return fail
execute if block ~-1 ~ ~ minecraft:nether_portal run return fail
execute if block ~ ~ ~1 minecraft:nether_portal run return fail
execute if block ~ ~ ~-1 minecraft:nether_portal run return fail
execute if block ~ ~1 ~ minecraft:nether_portal run return fail
execute if block ~ ~-1 ~ minecraft:nether_portal run return fail
function overlimit:nether_overflow/forget_gate
kill @s
