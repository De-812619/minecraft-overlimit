# 静止時だけ防御。動いた／乗っている／空中は付けない。
scoreboard players set #still overlimit.const 1
execute if score @s overlimit.trim.walk matches 1.. run scoreboard players set #still overlimit.const 0
execute if score @s overlimit.trim.sprint matches 1.. run scoreboard players set #still overlimit.const 0
execute if score @s overlimit.trim.crouch matches 1.. run scoreboard players set #still overlimit.const 0
execute if score @s overlimit.trim.swim matches 1.. run scoreboard players set #still overlimit.const 0
execute if score @s overlimit.trim.fly matches 1.. run scoreboard players set #still overlimit.const 0
execute if score @s overlimit.trim.climb matches 1.. run scoreboard players set #still overlimit.const 0
execute if score @s overlimit.trim.fall matches 1.. run scoreboard players set #still overlimit.const 0
execute if score @s overlimit.trim.horse matches 1.. run scoreboard players set #still overlimit.const 0
execute if score @s overlimit.trim.boat matches 1.. run scoreboard players set #still overlimit.const 0
execute unless predicate overlimit:trim/on_ground run scoreboard players set #still overlimit.const 0
execute on vehicle run scoreboard players set #still overlimit.const 0
execute if score #still overlimit.const matches 0 run return fail
execute store result storage overlimit:trim tmp.amount double 0.5 run scoreboard players get @s overlimit.trim.resin
data merge storage overlimit:trim {tmp:{id:"overlimit:trim.resin.armor",attr:"minecraft:armor",op:"add_value"}}
function overlimit:trim/mod_add with storage overlimit:trim tmp
