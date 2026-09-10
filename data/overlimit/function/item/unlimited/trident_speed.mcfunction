# 投げた瞬間の Motion を 2 倍（黄金弓と同じスケール）
execute store result entity @s Motion[0] double 0.0002 run data get entity @s Motion[0] 10000
execute store result entity @s Motion[1] double 0.0002 run data get entity @s Motion[1] 10000
execute store result entity @s Motion[2] double 0.0002 run data get entity @s Motion[2] 10000
