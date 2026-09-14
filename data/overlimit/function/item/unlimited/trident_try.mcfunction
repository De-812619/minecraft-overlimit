# @s = 投げられた UNLIMITED トライデント。着弾（地面 or 命中）で一度だけ。
execute if entity @s[tag=overlimit.ul.tri_boom] run return fail
execute if data entity @s {DealtDamage:1b} run return run function overlimit:item/unlimited/trident_boom
execute if data entity @s {inGround:1b} run return run function overlimit:item/unlimited/trident_boom
return fail
