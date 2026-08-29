# @s = クリア時にオーバーワールドにいたプレイヤー
execute align xyz positioned ~1.5 ~0.5 ~0.5 if function overlimit:nether_overflow/try_chest_spot run return 1
execute align xyz positioned ~-0.5 ~0.5 ~0.5 if function overlimit:nether_overflow/try_chest_spot run return 1
execute align xyz positioned ~0.5 ~0.5 ~1.5 if function overlimit:nether_overflow/try_chest_spot run return 1
execute align xyz positioned ~0.5 ~0.5 ~-0.5 if function overlimit:nether_overflow/try_chest_spot run return 1
execute align xyz positioned ~1.5 ~1.5 ~0.5 if function overlimit:nether_overflow/try_chest_spot run return 1
execute align xyz positioned ~0.5 ~1.5 ~0.5 if function overlimit:nether_overflow/try_chest_spot run return 1
execute align xyz positioned ~0.5 ~0.5 ~0.5 run loot spawn ~ ~0.5 ~ loot overlimit:nether_overflow_reward
return 1
