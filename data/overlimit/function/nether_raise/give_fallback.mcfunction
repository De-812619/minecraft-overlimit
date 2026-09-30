loot give @s loot overlimit:nether_raise_reward
function overlimit:reward/give_unlimited
execute if score #nr_omen overlimit.const matches 1 run loot give @s loot overlimit:nether_raise_reward
execute if score #nr_omen overlimit.const matches 1 run function overlimit:reward/give_unlimited
return 1
