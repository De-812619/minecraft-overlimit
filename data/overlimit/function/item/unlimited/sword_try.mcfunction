# 剣を持っているときだけ斬撃を出す（入力 predicate の attack は 26.2 に無い）
execute unless items entity @s weapon.mainhand *[custom_data~{overlimit:{unlimited_sword:true}}] run return fail
execute if score @s overlimit.ul.sw_cd matches 1.. run return fail
execute anchored eyes positioned ^ ^ ^0.8 unless block ~ ~ ~ #minecraft:replaceable run return fail
scoreboard players set @s overlimit.ul.sw_cd 6
item modify entity @s weapon.mainhand overlimit:unlimited_slash_wear
execute anchored eyes positioned ^ ^ ^0.8 run function overlimit:item/unlimited/slash_spawn
