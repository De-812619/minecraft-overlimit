execute if block ~ ~ ~ minecraft:nether_portal run return run function overlimit:nether_overflow/register_here
execute if block ~ ~1 ~ minecraft:nether_portal positioned ~ ~1 ~ run return run function overlimit:nether_overflow/register_here
execute if block ~1 ~ ~ minecraft:nether_portal positioned ~1 ~ ~ run return run function overlimit:nether_overflow/register_here
execute if block ~-1 ~ ~ minecraft:nether_portal positioned ~-1 ~ ~ run return run function overlimit:nether_overflow/register_here
execute if block ~ ~ ~1 minecraft:nether_portal positioned ~ ~ ~1 run return run function overlimit:nether_overflow/register_here
execute if block ~ ~ ~-1 minecraft:nether_portal positioned ~ ~ ~-1 run return run function overlimit:nether_overflow/register_here
return fail
