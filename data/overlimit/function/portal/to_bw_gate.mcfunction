# オーバーワールドの門 → 既存のブラッドワールドの門へ。1:1 だと海に落ちて門を積み増す。
tag @s add overlimit.portal_arrive
scoreboard players set @s overlimit.portal_wait 0
execute store result storage overlimit:portal tp.x int 1 run scoreboard players get @s overlimit.bwx
execute store result storage overlimit:portal tp.y int 1 run scoreboard players get @s overlimit.bwy
execute store result storage overlimit:portal tp.z int 1 run scoreboard players get @s overlimit.bwz
data modify storage overlimit:portal tp.dim set value "overlimit:blood_world"
function overlimit:portal/tp_to with storage overlimit:portal tp
function overlimit:portal/nausea_off
schedule function overlimit:portal/arrive 2t
