scoreboard players set #m overlimit.const -999
execute store result score #m overlimit.const run attribute @s minecraft:attack_damage modifier value get overlimit:trim.emerald.aura 100
execute if score #m overlimit.const matches -999 run tellraw @a[tag=overlimit.trim.dbg,limit=1] [{"text":"  ","color":"red"},{"selector":"@s"},{"text":" aura なし（期待 -20 /100）","color":"red"}]
execute unless score #m overlimit.const matches -999 run tellraw @a[tag=overlimit.trim.dbg,limit=1] [{"text":"  ","color":"gray"},{"selector":"@s"},{"text":" aura ","color":"gray"},{"score":{"name":"#m","objective":"overlimit.const"}},{"text":" /100  （期待 -20）","color":"dark_gray"}]
