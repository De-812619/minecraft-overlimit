# 視線先の固体ブロック座標をスコアに保存（到達 5 ブロック、歩幅 0.1）
scoreboard players set @s overlimit.hd_ok 0
scoreboard players set #hd_ray overlimit.const 0
execute at @s anchored eyes positioned ^ ^ ^0.1 run function overlimit:enchant/hyper_dig/look_ray
