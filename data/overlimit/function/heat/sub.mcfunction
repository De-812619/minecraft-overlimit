execute if score #heat overlimit.const matches ..0 run return fail
scoreboard players remove #heat overlimit.const 1
function overlimit:heat/refresh
tellraw @a [{"text":"ヒートが ","color":"aqua"},{"score":{"name":"#heat","objective":"overlimit.const"},"color":"aqua","bold":true},{"text":" に下がった。","color":"aqua"}]
