execute as @a run function overlimit:item/i18n_convert/player
execute as @e[type=minecraft:item] run function overlimit:item/i18n_convert/dropped
tellraw @s [{"translate": "overlimit.cmd.prefix","color":"gold"},{"translate": "overlimit.cmd.i18n_convert","color":"gray"}]
