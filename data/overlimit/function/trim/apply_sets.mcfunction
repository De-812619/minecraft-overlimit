execute if entity @s[tag=overlimit.trim.set.iron] run attribute @s minecraft:knockback_resistance modifier add overlimit:trim.iron.kb 0.1 add_value
execute if entity @s[tag=overlimit.trim.set.redstone] run attribute @s minecraft:block_interaction_range modifier add overlimit:trim.redstone.reach 3.0 add_value
execute if entity @s[tag=overlimit.trim.set.netherite] run attribute @s minecraft:burning_time modifier add overlimit:trim.netherite.burn -0.8 add_multiplied_base
execute if entity @s[tag=overlimit.trim.set.diamond] run function overlimit:trim/diamond/full_hp
execute if entity @s[tag=overlimit.trim.set.lapis] run function overlimit:trim/lapis/scale
