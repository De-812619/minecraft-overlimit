execute store result score #lv overlimit.const run data get entity @s XpLevel
execute if score #lv overlimit.const matches 31.. run scoreboard players set #lv overlimit.const 30
execute if score #lv overlimit.const matches 0 run return fail
execute store result storage overlimit:trim tmp.amount double 0.05 run scoreboard players get #lv overlimit.const
data merge storage overlimit:trim {tmp:{id:"overlimit:trim.lapis.atk",attr:"minecraft:attack_damage",op:"add_value"}}
function overlimit:trim/mod_add with storage overlimit:trim tmp
data merge storage overlimit:trim {tmp:{id:"overlimit:trim.lapis.def",attr:"minecraft:armor",op:"add_value"}}
function overlimit:trim/mod_add with storage overlimit:trim tmp
