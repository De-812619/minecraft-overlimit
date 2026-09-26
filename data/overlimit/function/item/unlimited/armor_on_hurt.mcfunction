# @s = 直接攻撃を受けたプレイヤー
# HERO 回復は Java PlayerHeal（AFTER_DAMAGE + setHealth +3）。二重発動を避ける。
advancement revoke @s only overlimit:item/unlimited_armor_hurt
execute at @s run function overlimit:item/unlimited/armor_demon_try
