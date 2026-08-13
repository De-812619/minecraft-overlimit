execute store result storage overlimit:hyper_dig pos.x int 1 run scoreboard players get @s overlimit.hd_px
execute store result storage overlimit:hyper_dig pos.y int 1 run scoreboard players get @s overlimit.hd_py
execute store result storage overlimit:hyper_dig pos.z int 1 run scoreboard players get @s overlimit.hd_pz
function overlimit:enchant/hyper_dig/check_and_break with storage overlimit:hyper_dig pos
