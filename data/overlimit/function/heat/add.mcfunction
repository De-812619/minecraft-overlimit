execute if score #heat overlimit.const matches 5.. run return fail
scoreboard players add #heat overlimit.const 1
function overlimit:heat/refresh
tellraw @a [{"text":"脅威指数が ","color":"gold"},{"score":{"name":"#heat","objective":"overlimit.const"},"color":"gold","bold":true},{"text":" になった。","color":"gold"}]
