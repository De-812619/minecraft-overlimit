# デバッグ: /function overlimit:heat/force_set {n:3}
$scoreboard players set #heat overlimit.const $(n)
execute if score #heat overlimit.const matches 6.. run scoreboard players set #heat overlimit.const 5
execute if score #heat overlimit.const matches ..-1 run scoreboard players set #heat overlimit.const 0
function overlimit:heat/refresh
tellraw @s [{"text":"[overlimit] 脅威指数を ","color":"gold"},{"score":{"name":"#heat","objective":"overlimit.const"},"color":"yellow"},{"text":" に設定した","color":"gold"}]
