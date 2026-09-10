# 誰からも 25 マス以上、または高さ帯の外にいるイベント敵を撃破点なしで消す。
# bm_ow だけ。if dimension は execute in overworld の実行次元を見る。
execute as @e[tag=overlimit.blood_moon,tag=overlimit.bm_ow] at @s run function overlimit:blood_moon/cull_one
