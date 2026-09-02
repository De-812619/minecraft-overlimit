execute if block ~ ~ ~ minecraft:nether_portal run return fail
execute if block ~ ~1 ~ minecraft:nether_portal run return fail
execute positioned over motion_blocking_no_leaves if function overlimit:nether_overflow/spawn_column run return 1
execute positioned over world_surface if function overlimit:nether_overflow/spawn_column run return 1
execute if function overlimit:nether_overflow/spawn_column run return 1
execute positioned ~ ~1 ~ if function overlimit:nether_overflow/spawn_column run return 1
execute positioned ~ ~-1 ~ if function overlimit:nether_overflow/spawn_column run return 1
execute positioned ~ ~2 ~ if function overlimit:nether_overflow/spawn_column run return 1
execute positioned ~ ~-2 ~ if function overlimit:nether_overflow/spawn_column run return 1
execute positioned ~ ~3 ~ if function overlimit:nether_overflow/spawn_column run return 1
execute positioned ~ ~-3 ~ if function overlimit:nether_overflow/spawn_column run return 1
execute positioned ~ ~4 ~ if function overlimit:nether_overflow/spawn_column run return 1
execute positioned ~ ~-4 ~ if function overlimit:nether_overflow/spawn_column run return 1
return fail
