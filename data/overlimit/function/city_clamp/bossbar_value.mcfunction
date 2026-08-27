execute if score #cc_combat overlimit.const matches 0 run return run function overlimit:city_clamp/bossbar_value_gather
execute store result score #cc_left overlimit.const run scoreboard players get #cc_time_max overlimit.const
scoreboard players operation #cc_left overlimit.const -= #cc_t overlimit.const
execute if score #cc_left overlimit.const matches ..-1 run scoreboard players set #cc_left overlimit.const 0
execute store result bossbar overlimit:city_clamp max run scoreboard players get #cc_time_max overlimit.const
execute store result bossbar overlimit:city_clamp value run scoreboard players get #cc_left overlimit.const
