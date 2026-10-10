loot give @s loot overlimit:blood_moon_reward
function overlimit:reward/give_unlimited
execute if score #bm_omen overlimit.const matches 1 run loot give @s loot overlimit:blood_moon_reward
execute if score #bm_omen overlimit.const matches 1 run function overlimit:reward/give_unlimited
execute if score #bw_omen overlimit.const matches 1 unless score #bm_omen overlimit.const matches 1 run loot give @s loot overlimit:blood_moon_reward
execute if score #bw_omen overlimit.const matches 1 unless score #bm_omen overlimit.const matches 1 run function overlimit:reward/give_unlimited
return 1
