clear @s *[custom_data~{overlimit:{holy_totem:true}}] 1
give @s minecraft:gold_block 4
give @s minecraft:poisonous_potato 3
tellraw @s {"translate": "overlimit.msg.holy.craft_reject","color":"gray"}
