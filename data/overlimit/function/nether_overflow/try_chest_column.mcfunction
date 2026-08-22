execute unless loaded ~ ~ ~ run return fail
execute if function overlimit:nether_overflow/try_chest_spot run return 1
execute positioned ~ ~-1 ~ if function overlimit:nether_overflow/try_chest_spot run return 1
execute positioned ~ ~-2 ~ if function overlimit:nether_overflow/try_chest_spot run return 1
execute positioned ~ ~1 ~ if function overlimit:nether_overflow/try_chest_spot run return 1
return fail
