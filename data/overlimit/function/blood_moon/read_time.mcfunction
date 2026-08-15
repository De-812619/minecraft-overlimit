# 26.2: time query time がオーバーワールド時計の累計tick
execute store result score #bm_total overlimit.const run time query time
scoreboard players operation #bm_tod overlimit.const = #bm_total overlimit.const
scoreboard players operation #bm_tod overlimit.const %= #24000 overlimit.const
scoreboard players operation #bm_daynow overlimit.const = #bm_total overlimit.const
scoreboard players operation #bm_daynow overlimit.const /= #24000 overlimit.const
