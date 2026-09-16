execute if score #heat overlimit.const matches ..0 run return fail
scoreboard players remove #heat overlimit.const 1
function overlimit:heat/refresh
tellraw @a {"translate":"overlimit.msg.heat.dropped","color":"aqua","with":[{"score":{"name":"#heat","objective":"overlimit.const"},"color":"aqua","bold":true}]}
