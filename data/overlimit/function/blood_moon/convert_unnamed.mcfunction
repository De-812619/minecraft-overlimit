# 発生後に残った名前なし敵を強化する（召喚ペットは除外）
execute as @e[type=#overlimit:can_be_danger,tag=!overlimit.elite,tag=!overlimit.summon,tag=!overlimit.necro] unless data entity @s CustomName at @s if predicate overlimit:in_overworld run function overlimit:mob/scan_blood_moon
