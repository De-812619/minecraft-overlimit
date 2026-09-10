# 旧アイテム用フォールバック。視線の先の相手で爆発。
execute unless items entity @s weapon.mainhand *[custom_data~{overlimit:{unlimited_axe:true}}] run return fail
execute if score @s overlimit.ul.ax_cd matches 1.. run return fail
function overlimit:item/unlimited/axe_arm_cd
tag @s add overlimit.ul.atk
execute anchored eyes positioned ^ ^ ^1.8 as @n[distance=..2.5,type=!minecraft:player] at @s run function overlimit:item/unlimited/axe_blast
tag @s remove overlimit.ul.atk
