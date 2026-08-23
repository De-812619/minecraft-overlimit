execute if block ~ ~ ~ minecraft:nether_portal run return fail
execute if block ~1 ~ ~ minecraft:nether_portal run return fail
execute if block ~-1 ~ ~ minecraft:nether_portal run return fail
execute if block ~ ~ ~1 minecraft:nether_portal run return fail
execute if block ~ ~ ~-1 minecraft:nether_portal run return fail
execute if block ~ ~1 ~ minecraft:nether_portal run return fail
execute if block ~ ~-1 ~ minecraft:nether_portal run return fail
function overlimit:nether_overflow/forget_gate
kill @s
