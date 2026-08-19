# @s = クリア時にそのディメンションにいたプレイヤー（死亡画面でも位置はある）
execute align xyz positioned ~1.5 ~0.5 ~0.5 if function overlimit:blood_moon/try_chest_spot run return 1
execute align xyz positioned ~-0.5 ~0.5 ~0.5 if function overlimit:blood_moon/try_chest_spot run return 1
execute align xyz positioned ~0.5 ~0.5 ~1.5 if function overlimit:blood_moon/try_chest_spot run return 1
execute align xyz positioned ~0.5 ~0.5 ~-0.5 if function overlimit:blood_moon/try_chest_spot run return 1
execute align xyz positioned ~1.5 ~1.5 ~0.5 if function overlimit:blood_moon/try_chest_spot run return 1
execute align xyz positioned ~0.5 ~1.5 ~0.5 if function overlimit:blood_moon/try_chest_spot run return 1
execute align xyz positioned ~0.5 ~0.5 ~0.5 run loot spawn ~ ~0.5 ~ loot overlimit:blood_moon_book
return 1
