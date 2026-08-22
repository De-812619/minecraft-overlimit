execute if block ~ ~ ~ minecraft:nether_portal run return fail
execute if block ~ ~1 ~ minecraft:nether_portal run return fail
execute positioned over motion_blocking_no_leaves run return run function overlimit:nether_overflow/spawn_column
execute positioned over world_surface run function overlimit:nether_overflow/spawn_column
