# 実行位置（叩いたブロック中心）を pending として保存。execute summon なら距離セレクタに依存しない
scoreboard players set @s overlimit.hd_ok 1
execute align xyz run execute summon minecraft:marker run function overlimit:enchant/hyper_dig/marker_capture
execute store result score @s overlimit.hd_x run data get storage overlimit:hyper_dig cap[0]
execute store result score @s overlimit.hd_y run data get storage overlimit:hyper_dig cap[1]
execute store result score @s overlimit.hd_z run data get storage overlimit:hyper_dig cap[2]
