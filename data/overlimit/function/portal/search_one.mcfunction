execute unless loaded ~ ~ ~ run forceload add ~-16 ~-16 ~16 ~16
execute unless loaded ~ ~ ~ run return fail
execute unless score #bw_spread overlimit.const matches 1 run return run function overlimit:portal/search_spread_now
execute at @s if function overlimit:portal/find_land run return run function overlimit:portal/search_success
scoreboard players set #bw_spread overlimit.const 0
scoreboard players add #bw_rand_n overlimit.const 1
