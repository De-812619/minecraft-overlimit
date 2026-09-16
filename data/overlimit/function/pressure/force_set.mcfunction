# デバッグ: /function overlimit:pressure/force_set {n:12}
$scoreboard players set #pressure overlimit.const $(n)
execute if score #pressure overlimit.const matches 21.. run scoreboard players set #pressure overlimit.const 20
execute if score #pressure overlimit.const matches ..-1 run scoreboard players set #pressure overlimit.const 0
function overlimit:pressure/refresh
tellraw @s {"translate":"overlimit.cmd.pressure.set","color":"dark_red","with":[{"score":{"name":"#pressure","objective":"overlimit.const"},"color":"red"}]}
