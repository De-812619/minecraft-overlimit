# 旧門の ±192 などがセーブに残った forceload を消す。自分で置いた forceload も消える。
execute in minecraft:overworld run forceload remove all
execute in minecraft:the_nether run forceload remove all
execute in minecraft:the_end run forceload remove all
execute in overlimit:blood_world run forceload remove all
tellraw @s {"text":"[overlimit] 全ディメンションの forceload を解除した","color":"yellow"}
