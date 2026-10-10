execute if score #ul_boost overlimit.const matches 1 run return run loot give @s loot overlimit:reward_unlimited_milestone
execute if score #reward_event overlimit.const matches 1..2 run return run loot give @s loot overlimit:reward_unlimited
loot give @s loot overlimit:reward_unlimited_event
return 1
