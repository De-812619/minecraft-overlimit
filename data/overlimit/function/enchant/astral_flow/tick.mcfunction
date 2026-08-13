# スニーク中・満腹1以上。
# 発動中フラグ + 体力減少検知（吸収NBTは読めない／毎tick再付与で潰れるため使わない）。

scoreboard players set @s overlimit.astral.on 3

# Hunger 短パルス後始末
execute if score @s overlimit.astral.hunger_t matches 1 run effect clear @s minecraft:hunger
execute if score @s overlimit.astral.hunger_t matches 1.. run scoreboard players remove @s overlimit.astral.hunger_t 1

# 消費CD
execute if score @s overlimit.astral.draincd matches 1.. run scoreboard players remove @s overlimit.astral.draincd 1

# 体力が前tickより減っていたら被ダメとみなす
execute store result score #hp overlimit.const run data get entity @s Health 10
execute if score @s overlimit.astral.prev_hp matches 1.. if score #hp overlimit.const < @s overlimit.astral.prev_hp run function overlimit:enchant/astral_flow/do_drain

# do_drain の回復後の値を記録
execute store result score @s overlimit.astral.prev_hp run data get entity @s Health 10

particle minecraft:end_rod ~ ~1 ~ 0.12 0.3 0.12 0.005 1
