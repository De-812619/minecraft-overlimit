scoreboard players operation #pressure_won_day overlimit.const = #bm_daynow overlimit.const
scoreboard players set #pressure_idle overlimit.const 0
execute if score #pressure overlimit.const matches ..0 run return fail

scoreboard players remove #pressure overlimit.const 2
execute if score #pressure overlimit.const matches ..-1 run scoreboard players set #pressure overlimit.const 0
function overlimit:pressure/refresh
tellraw @a [{"text":"世界圧が ","color":"aqua"},{"score":{"name":"#pressure","objective":"overlimit.const"},"color":"aqua","bold":true},{"text":" に下がった。","color":"aqua"}]
