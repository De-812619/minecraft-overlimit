# ブラッドワールドの門 → 入ってきたオーバーワールドの門へ。1:1 だと海に落ちて再探索ループになる。
tag @s add overlimit.portal_arrive
scoreboard players set @s overlimit.portal_wait 0
execute store result storage overlimit:portal tp.x int 1 run scoreboard players get @s overlimit.owx
execute store result storage overlimit:portal tp.y int 1 run scoreboard players get @s overlimit.owy
execute store result storage overlimit:portal tp.z int 1 run scoreboard players get @s overlimit.owz
data modify storage overlimit:portal tp.dim set value "minecraft:overworld"
function overlimit:portal/tp_to with storage overlimit:portal tp
schedule function overlimit:portal/arrive 1t replace
