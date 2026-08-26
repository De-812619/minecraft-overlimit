execute if score #pressure overlimit.const matches 20.. run return fail
scoreboard players add #pressure overlimit.const 1
function overlimit:pressure/refresh
tellraw @a [{"text":"世界圧が ","color":"dark_red"},{"score":{"name":"#pressure","objective":"overlimit.const"},"color":"red","bold":true},{"text":" になった。","color":"dark_red"}]
