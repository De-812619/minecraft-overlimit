scoreboard players set #pressure overlimit.const 0
scoreboard players operation #pressure_won_day overlimit.const = #bm_daynow overlimit.const
function overlimit:pressure/refresh
tellraw @a [{"text":"世界圧が ","color":"gold"},{"text":"0","color":"gold","bold":true},{"text":" にリセットされた。","color":"gold"}]
