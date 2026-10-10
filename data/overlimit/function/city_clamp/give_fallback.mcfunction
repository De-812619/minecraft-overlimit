loot give @s loot overlimit:city_clamp_reward
function overlimit:reward/give_unlimited
execute if score #cc_omen overlimit.const matches 1 run loot give @s loot overlimit:city_clamp_reward
execute if score #cc_omen overlimit.const matches 1 run function overlimit:reward/give_unlimited
return 1
