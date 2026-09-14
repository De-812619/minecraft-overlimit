execute store result storage overlimit:trim dbg.v double 0.01 run attribute @s minecraft:armor get 100
tellraw @s [{"text":"  防御 ","color":"gray"},{"nbt":"dbg.v","storage":"overlimit:trim","color":"white"}]
execute store result storage overlimit:trim dbg.v double 0.01 run attribute @s minecraft:attack_damage get 100
tellraw @s [{"text":"  攻撃 ","color":"gray"},{"nbt":"dbg.v","storage":"overlimit:trim","color":"white"}]
execute store result storage overlimit:trim dbg.v double 0.001 run attribute @s minecraft:movement_speed get 1000
tellraw @s [{"text":"  移動 ","color":"gray"},{"nbt":"dbg.v","storage":"overlimit:trim","color":"white"}]
execute store result storage overlimit:trim dbg.v double 0.01 run attribute @s minecraft:max_health get 100
tellraw @s [{"text":"  最大HP ","color":"gray"},{"nbt":"dbg.v","storage":"overlimit:trim","color":"white"}]
execute store result storage overlimit:trim dbg.v double 0.01 run attribute @s minecraft:attack_speed get 100
tellraw @s [{"text":"  攻速 ","color":"gray"},{"nbt":"dbg.v","storage":"overlimit:trim","color":"white"}]
execute store result storage overlimit:trim dbg.v double 0.01 run attribute @s minecraft:sneaking_speed get 100
tellraw @s [{"text":"  スニーク ","color":"gray"},{"nbt":"dbg.v","storage":"overlimit:trim","color":"white"}]
execute store result storage overlimit:trim dbg.v double 0.01 run attribute @s minecraft:block_interaction_range get 100
tellraw @s [{"text":"  リーチ ","color":"gray"},{"nbt":"dbg.v","storage":"overlimit:trim","color":"white"}]
execute store result storage overlimit:trim dbg.v double 0.01 run attribute @s minecraft:luck get 100
tellraw @s [{"text":"  幸運 ","color":"gray"},{"nbt":"dbg.v","storage":"overlimit:trim","color":"white"}]
execute store result storage overlimit:trim dbg.v double 0.01 run attribute @s minecraft:fall_damage_multiplier get 100
tellraw @s [{"text":"  落下倍率 ","color":"gray"},{"nbt":"dbg.v","storage":"overlimit:trim","color":"white"}]
execute store result storage overlimit:trim dbg.v double 0.01 run attribute @s minecraft:burning_time get 100
tellraw @s [{"text":"  炎上時間 ","color":"gray"},{"nbt":"dbg.v","storage":"overlimit:trim","color":"white"}]
execute store result storage overlimit:trim dbg.v double 0.01 run attribute @s minecraft:knockback_resistance get 100
tellraw @s [{"text":"  KB耐性 ","color":"gray"},{"nbt":"dbg.v","storage":"overlimit:trim","color":"white"}]
