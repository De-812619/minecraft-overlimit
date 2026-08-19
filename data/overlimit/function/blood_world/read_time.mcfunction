# ブラッドワールド専用時計（オーバーワールドと共有しない）
execute store result score #bw_total overlimit.const run time of overlimit:blood_world query time
scoreboard players operation #bw_tod overlimit.const = #bw_total overlimit.const
scoreboard players operation #bw_tod overlimit.const %= #24000 overlimit.const
scoreboard players operation #bw_daynow overlimit.const = #bw_total overlimit.const
scoreboard players operation #bw_daynow overlimit.const /= #24000 overlimit.const
