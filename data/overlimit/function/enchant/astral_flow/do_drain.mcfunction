# スニーク発動中だけ満腹消費。回復で実害を打ち消す。

# スニーク中フラグ（tick が維持）。非スニーク被弾では何もしない。
execute unless score @s overlimit.astral.on matches 1.. run return fail

execute if score @s overlimit.astral.draincd matches 1.. run return fail
scoreboard players set @s overlimit.astral.draincd 8

# 満腹消費（短時間 Hunger → tick で消去）
scoreboard players set @s overlimit.astral.hunger_t 5
effect give @s minecraft:hunger 1 255 true

# 受けたダメージを打ち消す
effect give @s minecraft:instant_health 1 4 true

particle minecraft:end_rod ~ ~1 ~ 0.4 0.8 0.4 0.03 20
playsound minecraft:entity.enderman.teleport player @a ~ ~ ~ 1 1.4
playsound minecraft:entity.player.burp player @s ~ ~ ~ 1 1
