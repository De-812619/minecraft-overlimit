execute if score #nr_combat overlimit.const matches 0 run return run function overlimit:nether_raise/bossbar_value_gather
execute store result score #nr_left overlimit.const run scoreboard players get #nr_time_max overlimit.const
scoreboard players operation #nr_left overlimit.const -= #nr_t overlimit.const
execute if score #nr_left overlimit.const matches ..-1 run scoreboard players set #nr_left overlimit.const 0
execute store result bossbar overlimit:nether_raise max run scoreboard players get #nr_time_max overlimit.const
execute store result bossbar overlimit:nether_raise value run scoreboard players get #nr_left overlimit.const
