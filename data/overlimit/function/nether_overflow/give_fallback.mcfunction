loot give @s loot overlimit:nether_overflow_reward
function overlimit:reward/give_unlimited
execute if score #no_omen overlimit.const matches 1 run loot give @s loot overlimit:nether_overflow_reward
execute if score #no_omen overlimit.const matches 1 run function overlimit:reward/give_unlimited
return 1
