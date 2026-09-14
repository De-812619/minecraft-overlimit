tag @s remove overlimit.reforge_ok
tag @s remove overlimit.reforge_ban
clear @s *[custom_data~{overlimit:{reforge_token:true}}] 1
give @s minecraft:diamond_block 1
tellraw @s {"text":"UNLIMITEDは再鍛できない。ダイヤブロックは返した。両端の装備は戻せない。","color":"gray"}
return 1
