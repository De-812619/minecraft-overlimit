execute if function overlimit:nether_overflow/place_reward_front run return 1
execute positioned ~2 ~ ~ if function overlimit:nether_overflow/try_chest_column run return 1
execute positioned ~-2 ~ ~ if function overlimit:nether_overflow/try_chest_column run return 1
execute positioned ~ ~ ~2 if function overlimit:nether_overflow/try_chest_column run return 1
execute positioned ~ ~ ~-2 if function overlimit:nether_overflow/try_chest_column run return 1
execute positioned ~3 ~ ~ if function overlimit:nether_overflow/try_chest_column run return 1
execute positioned ~-3 ~ ~ if function overlimit:nether_overflow/try_chest_column run return 1
execute positioned ~ ~ ~3 if function overlimit:nether_overflow/try_chest_column run return 1
execute positioned ~ ~ ~-3 if function overlimit:nether_overflow/try_chest_column run return 1
execute positioned ~2 ~ ~2 if function overlimit:nether_overflow/try_chest_column run return 1
execute positioned ~2 ~ ~-2 if function overlimit:nether_overflow/try_chest_column run return 1
execute positioned ~-2 ~ ~2 if function overlimit:nether_overflow/try_chest_column run return 1
execute positioned ~-2 ~ ~-2 if function overlimit:nether_overflow/try_chest_column run return 1
execute positioned ~2 ~ ~ run loot spawn ~ ~ ~ loot overlimit:nether_overflow_reward
return 1
