# 発生後に残った名前なし敵を強化する（召喚ペットは除外。プレイヤーから32マス以内だけ）
execute as @e[type=#overlimit:can_be_danger,tag=!overlimit.elite,tag=!overlimit.summon,tag=!overlimit.necro] unless data entity @s CustomName at @s if predicate overlimit:in_overworld if entity @a[predicate=overlimit:in_overworld,gamemode=!spectator,distance=..32] run function overlimit:mob/scan_blood_moon
