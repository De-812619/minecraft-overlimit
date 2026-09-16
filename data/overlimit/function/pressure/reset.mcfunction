scoreboard players set #pressure overlimit.const 0
scoreboard players operation #pressure_won_day overlimit.const = #bm_daynow overlimit.const
scoreboard players set #pressure_idle overlimit.const 0

function overlimit:pressure/refresh
tellraw @a {"translate":"overlimit.msg.pressure.reset","color":"gold","with":[{"text":"0","color":"gold","bold":true}]}
