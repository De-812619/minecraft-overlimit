execute if score #pressure_day overlimit.const = #bm_daynow overlimit.const run return fail
execute if score #pressure_won_day overlimit.const = #bm_day overlimit.const run return run scoreboard players operation #pressure_day overlimit.const = #bm_daynow overlimit.const
scoreboard players operation #pressure_day overlimit.const = #bm_daynow overlimit.const
function overlimit:pressure/add_1
