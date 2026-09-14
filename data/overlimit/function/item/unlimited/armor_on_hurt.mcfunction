# @s = 直接攻撃を受けたプレイヤー
advancement revoke @s only overlimit:item/unlimited_armor_hurt
execute at @s run function overlimit:item/unlimited/armor_royal_try
execute at @s run function overlimit:item/unlimited/armor_demon_try
