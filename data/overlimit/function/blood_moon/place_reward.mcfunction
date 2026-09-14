# @s = クリア時にそのディメンションにいたプレイヤー（死亡画面でも位置はある）
data modify storage overlimit:reward fn set value "overlimit:blood_moon/try_chest_spot"
data modify storage overlimit:reward give set value "overlimit:blood_moon/give_fallback"
return run function overlimit:reward/scan_chest_spots with storage overlimit:reward
