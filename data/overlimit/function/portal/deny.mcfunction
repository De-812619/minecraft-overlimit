tellraw @s {"text":"ブラッドムーンの間はブラッドワールドに入れない","color":"red"}
playsound minecraft:entity.villager.no player @s ~ ~ ~ 0.8 1
scoreboard players set @s overlimit.portal_cd 40
