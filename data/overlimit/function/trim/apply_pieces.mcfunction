execute if score @s overlimit.trim.iron matches 1.. store result storage overlimit:trim tmp.amount double 0.5 run scoreboard players get @s overlimit.trim.iron
execute if score @s overlimit.trim.iron matches 1.. run data merge storage overlimit:trim {tmp:{id:"overlimit:trim.iron.armor",attr:"minecraft:armor",op:"add_value"}}
execute if score @s overlimit.trim.iron matches 1.. run function overlimit:trim/mod_add with storage overlimit:trim tmp

execute if score @s overlimit.trim.gold matches 1.. store result storage overlimit:trim tmp.amount double 0.01 run scoreboard players get @s overlimit.trim.gold
execute if score @s overlimit.trim.gold matches 1.. run data merge storage overlimit:trim {tmp:{id:"overlimit:trim.gold.speed",attr:"minecraft:movement_speed",op:"add_multiplied_base"}}
execute if score @s overlimit.trim.gold matches 1.. run function overlimit:trim/mod_add with storage overlimit:trim tmp

execute if score @s overlimit.trim.diamond matches 1.. store result storage overlimit:trim tmp.amount double 0.5 run scoreboard players get @s overlimit.trim.diamond
execute if score @s overlimit.trim.diamond matches 1.. run data merge storage overlimit:trim {tmp:{id:"overlimit:trim.diamond.atk",attr:"minecraft:attack_damage",op:"add_value"}}
execute if score @s overlimit.trim.diamond matches 1.. run function overlimit:trim/mod_add with storage overlimit:trim tmp

execute if score @s overlimit.trim.netherite matches 1.. store result storage overlimit:trim tmp.amount double 1.0 run scoreboard players get @s overlimit.trim.netherite
execute if score @s overlimit.trim.netherite matches 1.. run data merge storage overlimit:trim {tmp:{id:"overlimit:trim.netherite.hp",attr:"minecraft:max_health",op:"add_value"}}
execute if score @s overlimit.trim.netherite matches 1.. run function overlimit:trim/mod_add with storage overlimit:trim tmp

execute if score @s overlimit.trim.copper matches 1.. store result storage overlimit:trim tmp.amount double 0.02 run scoreboard players get @s overlimit.trim.copper
execute if score @s overlimit.trim.copper matches 1.. run data merge storage overlimit:trim {tmp:{id:"overlimit:trim.copper.aspeed",attr:"minecraft:attack_speed",op:"add_multiplied_base"}}
execute if score @s overlimit.trim.copper matches 1.. run function overlimit:trim/mod_add with storage overlimit:trim tmp

execute if score @s overlimit.trim.redstone matches 1.. store result storage overlimit:trim tmp.amount double 0.05 run scoreboard players get @s overlimit.trim.redstone
execute if score @s overlimit.trim.redstone matches 1.. run data merge storage overlimit:trim {tmp:{id:"overlimit:trim.redstone.sneak",attr:"minecraft:sneaking_speed",op:"add_multiplied_base"}}
execute if score @s overlimit.trim.redstone matches 1.. run function overlimit:trim/mod_add with storage overlimit:trim tmp

execute if score @s overlimit.trim.lapis matches 1.. store result storage overlimit:trim tmp.amount double 0.25 run scoreboard players get @s overlimit.trim.lapis
execute if score @s overlimit.trim.lapis matches 1.. run data merge storage overlimit:trim {tmp:{id:"overlimit:trim.lapis.luck",attr:"minecraft:luck",op:"add_value"}}
execute if score @s overlimit.trim.lapis matches 1.. run function overlimit:trim/mod_add with storage overlimit:trim tmp

execute if score @s overlimit.trim.amethyst matches 1.. store result storage overlimit:trim tmp.amount double -0.08 run scoreboard players get @s overlimit.trim.amethyst
execute if score @s overlimit.trim.amethyst matches 1.. run data merge storage overlimit:trim {tmp:{id:"overlimit:trim.amethyst.fall",attr:"minecraft:fall_damage_multiplier",op:"add_multiplied_base"}}
execute if score @s overlimit.trim.amethyst matches 1.. run function overlimit:trim/mod_add with storage overlimit:trim tmp

execute if score @s overlimit.trim.quartz matches 1.. store result storage overlimit:trim tmp.amount double 0.02 run scoreboard players get @s overlimit.trim.quartz
execute if score @s overlimit.trim.quartz matches 1.. run data merge storage overlimit:trim {tmp:{id:"overlimit:trim.quartz.aspeed",attr:"minecraft:attack_speed",op:"add_multiplied_base"}}
execute if score @s overlimit.trim.quartz matches 1.. run function overlimit:trim/mod_add with storage overlimit:trim tmp

execute if score @s overlimit.trim.resin matches 1.. run function overlimit:trim/resin/still_armor
