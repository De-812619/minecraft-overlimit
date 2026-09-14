loot insert ~ ~ ~ loot overlimit:blood_moon_reward
execute if score #bm_omen overlimit.const matches 1 run loot insert ~ ~ ~ loot overlimit:blood_moon_reward
execute if score #bw_omen overlimit.const matches 1 unless score #bm_omen overlimit.const matches 1 run loot insert ~ ~ ~ loot overlimit:blood_moon_reward
playsound minecraft:block.chest.locked block @a ~ ~ ~ 0.9 1.15
particle minecraft:happy_villager ~ ~0.4 ~ 0.25 0.25 0.25 0 10
return 1
