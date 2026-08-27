execute if block ~ ~ ~ minecraft:nether_portal run return fail
execute if block ~ ~1 ~ minecraft:nether_portal run return fail
execute if block ~ ~ ~ minecraft:lava run return fail
execute if block ~ ~1 ~ minecraft:lava run return fail
execute positioned over motion_blocking_no_leaves if function overlimit:city_clamp/spawn_column run return 1
execute positioned over world_surface if function overlimit:city_clamp/spawn_column run return 1
return fail
