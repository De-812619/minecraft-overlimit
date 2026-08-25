# 矢の速度を2倍（ダメージは速度比例で約2倍）
execute store result entity @s Motion[0] double 0.0002 run data get entity @s Motion[0] 10000
execute store result entity @s Motion[1] double 0.0002 run data get entity @s Motion[1] 10000
execute store result entity @s Motion[2] double 0.0002 run data get entity @s Motion[2] 10000

# 光の矢は本体が発光を付ける。それ以外は potion_contents で同等（10秒）
execute if entity @s[type=minecraft:spectral_arrow] run return 1
execute unless data entity @s item.components."minecraft:potion_contents".custom_effects run data modify entity @s item.components."minecraft:potion_contents".custom_effects set value [{id:"minecraft:glowing",amplifier:0,duration:200}]
execute if data entity @s item.components."minecraft:potion_contents".custom_effects unless data entity @s item.components."minecraft:potion_contents".custom_effects[{id:"minecraft:glowing"}] run data modify entity @s item.components."minecraft:potion_contents".custom_effects append value {id:"minecraft:glowing",amplifier:0,duration:200}
return 1
