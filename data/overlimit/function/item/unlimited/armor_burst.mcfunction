# @s = プレイヤー。半径6の敵対を壁安全に押し出す。演出は呼び出し側。
tag @s add overlimit.kb_center
execute as @e[type=#overlimit:hostile,distance=..6,tag=!overlimit.kb_center] at @s run function overlimit:item/unlimited/armor_knock
tag @s remove overlimit.kb_center
