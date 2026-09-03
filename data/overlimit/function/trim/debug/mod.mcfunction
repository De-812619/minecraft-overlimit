scoreboard players set #m overlimit.const -999
$execute store result score #m overlimit.const run attribute @s $(attr) modifier value get $(id) 100
$execute if score #m overlimit.const matches -999 run tellraw @s [{"text":"  $(label) なし（期待あり）","color":"red"}]
$execute unless score #m overlimit.const matches -999 run tellraw @s [{"text":"  $(label) ","color":"gray"},{"score":{"name":"#m","objective":"overlimit.const"},"color":"white"},{"text":" /100","color":"dark_gray"}]
