# デバッグ: /function overlimit:pressure/force_set {n:12}
$scoreboard players set #pressure overlimit.const $(n)
execute if score #pressure overlimit.const matches 21.. run scoreboard players set #pressure overlimit.const 20
execute if score #pressure overlimit.const matches ..-1 run scoreboard players set #pressure overlimit.const 0
function overlimit:pressure/refresh
tellraw @s [{"text":"[overlimit] 世界圧を ","color":"dark_red"},{"score":{"name":"#pressure","objective":"overlimit.const"},"color":"red"},{"text":" に設定した","color":"dark_red"}]
