execute if score #pressure overlimit.const matches 20.. run return fail
scoreboard players add #pressure overlimit.const 1
function overlimit:pressure/refresh
tellraw @a {"translate":"overlimit.msg.pressure.became","color":"dark_red","with":[{"score":{"name":"#pressure","objective":"overlimit.const"},"color":"red","bold":true}]}
