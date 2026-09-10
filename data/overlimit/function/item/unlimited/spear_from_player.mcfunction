execute unless items entity @s weapon.mainhand *[custom_data~{overlimit:{unlimited_spear:true}}] run return fail
execute if score @s overlimit.ul.sp_cd matches 1.. run return fail
scoreboard players set @s overlimit.ul.sp_cd 2
tag @s add overlimit.ul.atk
execute anchored eyes positioned ^ ^ ^2 as @e[distance=..2.8,type=#overlimit:can_be_danger,limit=1,sort=nearest] at @s run function overlimit:item/unlimited/spear_apply
tag @s remove overlimit.ul.atk
