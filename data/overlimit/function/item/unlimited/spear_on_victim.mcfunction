# @s = post_attack の被害者。検索せず本人を感電させる。
execute on attacker unless entity @s[type=minecraft:player] run return fail
execute on attacker unless items entity @s weapon.mainhand *[custom_data~{overlimit:{unlimited_spear:true}}] run return fail
execute on attacker run tag @s add overlimit.ul.atk
function overlimit:item/unlimited/spear_apply
execute on attacker run tag @s remove overlimit.ul.atk
