# 32 だと間引き（水平25）の外までブラッドムーンに入り、出た直後に消えて頭数を食う
execute as @e[type=#overlimit:can_be_danger,tag=!overlimit.elite,tag=!overlimit.summon,tag=!overlimit.necro] unless data entity @s CustomName at @s if predicate overlimit:in_blood_world if entity @a[tag=overlimit.in_bw,gamemode=!spectator,distance=..16] run function overlimit:mob/scan_blood_moon
