execute if entity @e[tag=overlimit.no_ghast,limit=1] run return fail
execute if block ~ ~ ~ minecraft:nether_portal run return fail
execute if block ~ ~1 ~ minecraft:nether_portal run return fail
execute positioned over motion_blocking_no_leaves positioned ~ ~8 ~ if function overlimit:nether_overflow/maybe_ghast run return 1
execute positioned over world_surface positioned ~ ~8 ~ if function overlimit:nether_overflow/maybe_ghast run return 1
execute positioned over motion_blocking_no_leaves positioned ~ ~5 ~ if function overlimit:nether_overflow/maybe_ghast run return 1
return fail
