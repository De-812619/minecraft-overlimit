# 誰からも 25 マス以上、または高さ帯の外にいるイベント敵を撃破点なしで消す。
execute as @e[tag=overlimit.blood_moon] at @s run function overlimit:blood_moon/cull_one
