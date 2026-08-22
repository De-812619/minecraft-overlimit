execute store result score #no_left overlimit.const run scoreboard players get #no_time_max overlimit.const
scoreboard players operation #no_left overlimit.const -= #no_t overlimit.const
execute if score #no_left overlimit.const matches ..-1 run scoreboard players set #no_left overlimit.const 0
execute store result bossbar overlimit:nether_overflow value run scoreboard players get #no_left overlimit.const
scoreboard players operation #no_sec overlimit.const = #no_left overlimit.const
scoreboard players operation #no_sec overlimit.const /= #20 overlimit.const
scoreboard players operation #no_min overlimit.const = #no_sec overlimit.const
scoreboard players operation #no_min overlimit.const /= #60 overlimit.const
scoreboard players operation #no_sec overlimit.const %= #60 overlimit.const
