execute if function overlimit:nether_raise/try_start run return 1
scoreboard players operation #nr_dwell overlimit.const = #nr_dwell_max overlimit.const
scoreboard players remove #nr_dwell overlimit.const 600
return 0
