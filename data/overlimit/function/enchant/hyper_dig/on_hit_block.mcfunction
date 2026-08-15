# hit_block は破壊「開始」時に、まだブロックがある状態で走る。
# 実行位置はバニラが叩いたブロック中心。ここを pending にして、空気になったら 3×3 する。
# 連続採掘では次ブロックの hit_block が先に上書きするため、直前座標を残す。
execute if score @s overlimit.hd_ok matches 1 run function overlimit:enchant/hyper_dig/stash_prev
execute align xyz run function overlimit:enchant/hyper_dig/store_hit
