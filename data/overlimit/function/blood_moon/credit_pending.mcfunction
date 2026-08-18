# 未加算のイベント産 XP Marker をまとめて加点。朝判定より先に呼ぶ。
execute as @e[type=minecraft:marker,tag=overlimit.bm_xp,tag=!overlimit.bm_credited] at @s run function overlimit:blood_moon/credit_from_xp
