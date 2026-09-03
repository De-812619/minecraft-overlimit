scoreboard players set #setn overlimit.const 0
tellraw @s {"text":"[trim] セット（3部位以上）:","color":"gold"}
execute if entity @s[tag=overlimit.trim.set.iron] run scoreboard players add #setn overlimit.const 1
execute if entity @s[tag=overlimit.trim.set.gold] run scoreboard players add #setn overlimit.const 1
execute if entity @s[tag=overlimit.trim.set.diamond] run scoreboard players add #setn overlimit.const 1
execute if entity @s[tag=overlimit.trim.set.netherite] run scoreboard players add #setn overlimit.const 1
execute if entity @s[tag=overlimit.trim.set.copper] run scoreboard players add #setn overlimit.const 1
execute if entity @s[tag=overlimit.trim.set.redstone] run scoreboard players add #setn overlimit.const 1
execute if entity @s[tag=overlimit.trim.set.lapis] run scoreboard players add #setn overlimit.const 1
execute if entity @s[tag=overlimit.trim.set.emerald] run scoreboard players add #setn overlimit.const 1
execute if entity @s[tag=overlimit.trim.set.amethyst] run scoreboard players add #setn overlimit.const 1
execute if entity @s[tag=overlimit.trim.set.quartz] run scoreboard players add #setn overlimit.const 1
execute if entity @s[tag=overlimit.trim.set.resin] run scoreboard players add #setn overlimit.const 1
execute if entity @s[tag=overlimit.trim.set.iron] run tellraw @s {"text":"  iron","color":"#C0C0C0"}
execute if entity @s[tag=overlimit.trim.set.gold] run tellraw @s {"text":"  gold","color":"#DEB12D"}
execute if entity @s[tag=overlimit.trim.set.diamond] run tellraw @s {"text":"  diamond","color":"#6EECD2"}
execute if entity @s[tag=overlimit.trim.set.netherite] run tellraw @s {"text":"  netherite","color":"#625859"}
execute if entity @s[tag=overlimit.trim.set.copper] run tellraw @s {"text":"  copper","color":"#E77C56"}
execute if entity @s[tag=overlimit.trim.set.redstone] run tellraw @s {"text":"  redstone","color":"#971607"}
execute if entity @s[tag=overlimit.trim.set.lapis] run tellraw @s {"text":"  lapis","color":"#416E97"}
execute if entity @s[tag=overlimit.trim.set.emerald] run tellraw @s {"text":"  emerald","color":"#11A036"}
execute if entity @s[tag=overlimit.trim.set.amethyst] run tellraw @s {"text":"  amethyst","color":"#9A5CC6"}
execute if entity @s[tag=overlimit.trim.set.quartz] run tellraw @s {"text":"  quartz","color":"#E3D4C4"}
execute if entity @s[tag=overlimit.trim.set.resin] run tellraw @s {"text":"  resin","color":"#DE731C"}
execute if score #setn overlimit.const matches 0 run tellraw @s {"text":"  （なし）","color":"dark_gray"}
