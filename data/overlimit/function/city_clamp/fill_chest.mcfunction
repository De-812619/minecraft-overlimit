loot insert ~ ~ ~ loot overlimit:city_clamp_reward
function overlimit:reward/insert_unlimited
execute if score #cc_omen overlimit.const matches 1 run loot insert ~ ~ ~ loot overlimit:city_clamp_reward
execute if score #cc_omen overlimit.const matches 1 run function overlimit:reward/insert_unlimited
playsound minecraft:block.chest.locked block @a ~ ~ ~ 0.9 1.15
particle minecraft:happy_villager ~ ~0.4 ~ 0.25 0.25 0.25 0 10
return 1
