loot insert ~ ~ ~ loot overlimit:nether_raise_reward
function overlimit:reward/insert_unlimited
execute if score #nr_omen overlimit.const matches 1 run loot insert ~ ~ ~ loot overlimit:nether_raise_reward
execute if score #nr_omen overlimit.const matches 1 run function overlimit:reward/insert_unlimited
playsound minecraft:block.chest.locked block @a ~ ~ ~ 0.9 1.15
particle minecraft:happy_villager ~ ~0.4 ~ 0.25 0.25 0.25 0 10
return 1
