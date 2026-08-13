# 拘束: 周囲の敵。視認しやすい演出付き。
execute as @e[type=#overlimit:hostile,distance=..8] at @s run function overlimit:enchant/chain_bind/apply
particle minecraft:snowflake ~ ~1 ~ 4 0.6 4 0.02 80
particle minecraft:item_snowball ~ ~1 ~ 3 0.4 3 0.1 40
playsound minecraft:block.glass.break player @a ~ ~ ~ 1 0.5
playsound minecraft:entity.player.hurt_freeze player @a ~ ~ ~ 0.8 1
