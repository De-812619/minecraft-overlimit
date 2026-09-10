advancement revoke @s only overlimit:item/unlimited_hit
execute if items entity @s weapon.mainhand *[custom_data~{overlimit:{unlimited_sword:true}}] at @s run function overlimit:item/unlimited/sword_try
execute if items entity @s weapon.mainhand *[custom_data~{overlimit:{unlimited_axe:true}}] at @s run function overlimit:item/unlimited/axe_from_player
