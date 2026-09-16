tag @s remove overlimit.reforge_ok
tag @s remove overlimit.reforge_ban
clear @s *[custom_data~{overlimit:{reforge_token:true}}] 1
give @s minecraft:diamond_block 1
tellraw @s {"translate": "overlimit.msg.reforge.reject_ul","color":"gray"}
return 1
