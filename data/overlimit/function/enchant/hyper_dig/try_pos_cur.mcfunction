execute store result storage overlimit:hyper_dig pos.x int 1 run scoreboard players get @s overlimit.hd_x
execute store result storage overlimit:hyper_dig pos.y int 1 run scoreboard players get @s overlimit.hd_y
execute store result storage overlimit:hyper_dig pos.z int 1 run scoreboard players get @s overlimit.hd_z
function overlimit:enchant/hyper_dig/check_and_break with storage overlimit:hyper_dig pos
