loot insert ~ ~ ~ loot overlimit:nether_overflow_reward
execute if score #no_omen overlimit.const matches 1 run loot insert ~ ~ ~ loot overlimit:nether_overflow_reward
playsound minecraft:block.chest.locked block @a ~ ~ ~ 0.9 1.15
particle minecraft:happy_villager ~ ~0.4 ~ 0.25 0.25 0.25 0 10
return 1
