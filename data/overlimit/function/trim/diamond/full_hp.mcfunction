# HP満タンのとき攻撃 +10% と防御 +2（被ダメ-10%の近似。汎用ダメージ倍率属性が無い）
execute store result score #hp overlimit.const run data get entity @s Health 100
execute store result score #mx overlimit.const run attribute @s minecraft:max_health get 100
execute if score #hp overlimit.const < #mx overlimit.const run return fail
attribute @s minecraft:attack_damage modifier add overlimit:trim.diamond.set_atk 0.1 add_multiplied_base
attribute @s minecraft:armor modifier add overlimit:trim.diamond.set_dr 2.0 add_value
