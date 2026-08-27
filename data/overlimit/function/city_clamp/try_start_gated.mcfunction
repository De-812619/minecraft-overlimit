execute if function overlimit:city_clamp/try_start run return 1
scoreboard players operation #cc_dwell overlimit.const = #cc_dwell_max overlimit.const
scoreboard players remove #cc_dwell overlimit.const 600
return 0
