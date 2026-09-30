execute if score #ul_boost overlimit.const matches 1 run return run loot insert ~ ~ ~ loot overlimit:reward_unlimited_milestone
execute if score #reward_event overlimit.const matches 1..2 run return run loot insert ~ ~ ~ loot overlimit:reward_unlimited
loot insert ~ ~ ~ loot overlimit:reward_unlimited_event
return 1
