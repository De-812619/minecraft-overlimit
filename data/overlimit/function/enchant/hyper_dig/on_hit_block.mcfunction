# hit_block は破壊「開始」時に、まだブロックがある状態で走る。
# 実行位置はバニラが叩いたブロック中心。ここを pending にして、空気になったら 3×3 する。
execute align xyz run function overlimit:enchant/hyper_dig/store_hit
