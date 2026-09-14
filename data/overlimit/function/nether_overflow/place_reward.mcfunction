# @s = クリア時にオーバーワールドにいたプレイヤー
data modify storage overlimit:reward fn set value "overlimit:nether_overflow/try_chest_spot"
data modify storage overlimit:reward give set value "overlimit:nether_overflow/give_fallback"
return run function overlimit:reward/scan_chest_spots with storage overlimit:reward
