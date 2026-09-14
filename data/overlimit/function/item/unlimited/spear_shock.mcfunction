# @s = 止めるMob。速度倍率-1はレジン装飾で確認済み。
damage @s 3 minecraft:player_attack by @p[tag=overlimit.ul.atk]
effect give @s minecraft:slowness 2 6 false
attribute @s minecraft:movement_speed modifier remove overlimit:ul.para
attribute @s minecraft:movement_speed modifier add overlimit:ul.para -1 add_multiplied_total
data modify entity @s Motion set value [0.0d, 0.0d, 0.0d]
scoreboard players set @s overlimit.ul.para 40
