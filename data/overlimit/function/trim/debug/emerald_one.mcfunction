scoreboard players set #m overlimit.const -999
execute store result score #m overlimit.const run attribute @s minecraft:attack_damage modifier value get overlimit:trim.emerald.aura 100
execute if score #m overlimit.const matches -999 run tellraw @a[tag=overlimit.trim.dbg,limit=1] [{"text":"  ","color":"red"},{"selector":"@s"},{"translate":"overlimit.trim.dbg.aura_missing","color":"red"}]
execute unless score #m overlimit.const matches -999 run tellraw @a[tag=overlimit.trim.dbg,limit=1] [{"text":"  ","color":"gray"},{"selector":"@s"},{"translate":"overlimit.trim.dbg.aura_value","color":"gray","with":[{"score":{"name":"#m","objective":"overlimit.const"}}]}]
