# @s = 攻撃者。位置は相手のまま（execute on は座標を変えない）。
execute unless entity @s[type=minecraft:player] run return fail
execute unless items entity @s weapon.mainhand *[custom_data~{overlimit:{unlimited_axe:true}}] run return fail
execute if score @s overlimit.ul.ax_cd matches 1.. run return fail
function overlimit:item/unlimited/axe_arm_cd
tag @s add overlimit.ul.atk
function overlimit:item/unlimited/axe_blast
tag @s remove overlimit.ul.atk
