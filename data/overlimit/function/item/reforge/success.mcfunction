tag @s remove overlimit.reforge_ok
tag @s remove overlimit.reforge_ban
clear @s *[custom_data~{overlimit:{reforge_token:true}}] 1
loot give @s loot overlimit:reforge_gear
execute at @s run playsound minecraft:block.anvil.use player @s ~ ~ ~ 0.7 1.2
tellraw @s {"translate": "overlimit.msg.reforge.ok","color":"gold"}
return 1
