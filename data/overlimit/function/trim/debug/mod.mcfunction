scoreboard players set #m overlimit.const -999
$execute store result score #m overlimit.const run attribute @s $(attr) modifier value get $(id) 100
$execute if score #m overlimit.const matches -999 run tellraw @s {"translate":"overlimit.trim.dbg.mod.missing","color":"red","with":[{"text":"$(label)"}]}
$execute unless score #m overlimit.const matches -999 run tellraw @s {"translate":"overlimit.trim.dbg.mod.value","color":"gray","with":[{"text":"$(label)"},{"score":{"name":"#m","objective":"overlimit.const"},"color":"white"}]}
