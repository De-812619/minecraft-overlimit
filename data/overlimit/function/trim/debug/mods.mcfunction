execute if score @s overlimit.trim.iron matches 1.. run data modify storage overlimit:trim dbg set value {id:"overlimit:trim.iron.armor",attr:"minecraft:armor",label:"iron.armor"}
execute if score @s overlimit.trim.iron matches 1.. run function overlimit:trim/debug/mod with storage overlimit:trim dbg
execute if entity @s[tag=overlimit.trim.set.iron] run data modify storage overlimit:trim dbg set value {id:"overlimit:trim.iron.kb",attr:"minecraft:knockback_resistance",label:"iron.kb"}
execute if entity @s[tag=overlimit.trim.set.iron] run function overlimit:trim/debug/mod with storage overlimit:trim dbg
execute if score @s overlimit.trim.gold matches 1.. run data modify storage overlimit:trim dbg set value {id:"overlimit:trim.gold.speed",attr:"minecraft:movement_speed",label:"gold.speed"}
execute if score @s overlimit.trim.gold matches 1.. run function overlimit:trim/debug/mod with storage overlimit:trim dbg
execute if score @s overlimit.trim.diamond matches 1.. run data modify storage overlimit:trim dbg set value {id:"overlimit:trim.diamond.atk",attr:"minecraft:attack_damage",label:"diamond.atk"}
execute if score @s overlimit.trim.diamond matches 1.. run function overlimit:trim/debug/mod with storage overlimit:trim dbg
execute if entity @s[tag=overlimit.trim.set.diamond] if score #hp overlimit.const < #mx overlimit.const run tellraw @s {"text":"  diamond.set_atk/set_dr なし（満タンではない・正常）","color":"dark_gray"}
execute if entity @s[tag=overlimit.trim.set.diamond] unless score #hp overlimit.const < #mx overlimit.const run data modify storage overlimit:trim dbg set value {id:"overlimit:trim.diamond.set_atk",attr:"minecraft:attack_damage",label:"diamond.set_atk"}
execute if entity @s[tag=overlimit.trim.set.diamond] unless score #hp overlimit.const < #mx overlimit.const run function overlimit:trim/debug/mod with storage overlimit:trim dbg
execute if entity @s[tag=overlimit.trim.set.diamond] unless score #hp overlimit.const < #mx overlimit.const run data modify storage overlimit:trim dbg set value {id:"overlimit:trim.diamond.set_dr",attr:"minecraft:armor",label:"diamond.set_dr"}
execute if entity @s[tag=overlimit.trim.set.diamond] unless score #hp overlimit.const < #mx overlimit.const run function overlimit:trim/debug/mod with storage overlimit:trim dbg
execute if score @s overlimit.trim.netherite matches 1.. run data modify storage overlimit:trim dbg set value {id:"overlimit:trim.netherite.hp",attr:"minecraft:max_health",label:"netherite.hp"}
execute if score @s overlimit.trim.netherite matches 1.. run function overlimit:trim/debug/mod with storage overlimit:trim dbg
execute if entity @s[tag=overlimit.trim.set.netherite] run data modify storage overlimit:trim dbg set value {id:"overlimit:trim.netherite.burn",attr:"minecraft:burning_time",label:"netherite.burn"}
execute if entity @s[tag=overlimit.trim.set.netherite] run function overlimit:trim/debug/mod with storage overlimit:trim dbg
execute if score @s overlimit.trim.copper matches 1.. run data modify storage overlimit:trim dbg set value {id:"overlimit:trim.copper.aspeed",attr:"minecraft:attack_speed",label:"copper.aspeed"}
execute if score @s overlimit.trim.copper matches 1.. run function overlimit:trim/debug/mod with storage overlimit:trim dbg
execute if score @s overlimit.trim.redstone matches 1.. run data modify storage overlimit:trim dbg set value {id:"overlimit:trim.redstone.sneak",attr:"minecraft:sneaking_speed",label:"redstone.sneak"}
execute if score @s overlimit.trim.redstone matches 1.. run function overlimit:trim/debug/mod with storage overlimit:trim dbg
execute if entity @s[tag=overlimit.trim.set.redstone] run data modify storage overlimit:trim dbg set value {id:"overlimit:trim.redstone.reach",attr:"minecraft:block_interaction_range",label:"redstone.reach"}
execute if entity @s[tag=overlimit.trim.set.redstone] run function overlimit:trim/debug/mod with storage overlimit:trim dbg
execute if score @s overlimit.trim.lapis matches 1.. run data modify storage overlimit:trim dbg set value {id:"overlimit:trim.lapis.luck",attr:"minecraft:luck",label:"lapis.luck"}
execute if score @s overlimit.trim.lapis matches 1.. run function overlimit:trim/debug/mod with storage overlimit:trim dbg
execute if entity @s[tag=overlimit.trim.set.lapis] if score #lv overlimit.const matches 0 run tellraw @s {"text":"  lapis.atk/def なし（Lv0・正常）","color":"dark_gray"}
execute if entity @s[tag=overlimit.trim.set.lapis] if score #lv overlimit.const matches 1.. run data modify storage overlimit:trim dbg set value {id:"overlimit:trim.lapis.atk",attr:"minecraft:attack_damage",label:"lapis.atk"}
execute if entity @s[tag=overlimit.trim.set.lapis] if score #lv overlimit.const matches 1.. run function overlimit:trim/debug/mod with storage overlimit:trim dbg
execute if entity @s[tag=overlimit.trim.set.lapis] if score #lv overlimit.const matches 1.. run data modify storage overlimit:trim dbg set value {id:"overlimit:trim.lapis.def",attr:"minecraft:armor",label:"lapis.def"}
execute if entity @s[tag=overlimit.trim.set.lapis] if score #lv overlimit.const matches 1.. run function overlimit:trim/debug/mod with storage overlimit:trim dbg
execute if score @s overlimit.trim.amethyst matches 1.. run data modify storage overlimit:trim dbg set value {id:"overlimit:trim.amethyst.fall",attr:"minecraft:fall_damage_multiplier",label:"amethyst.fall"}
execute if score @s overlimit.trim.amethyst matches 1.. run function overlimit:trim/debug/mod with storage overlimit:trim dbg
execute if score @s overlimit.trim.quartz matches 1.. run data modify storage overlimit:trim dbg set value {id:"overlimit:trim.quartz.aspeed",attr:"minecraft:attack_speed",label:"quartz.aspeed"}
execute if score @s overlimit.trim.quartz matches 1.. run function overlimit:trim/debug/mod with storage overlimit:trim dbg
execute if score @s overlimit.trim.resin matches 1.. run data modify storage overlimit:trim dbg set value {id:"overlimit:trim.resin.armor",attr:"minecraft:armor",label:"resin.armor"}
execute if score @s overlimit.trim.resin matches 1.. run function overlimit:trim/debug/mod with storage overlimit:trim dbg
